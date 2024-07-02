//
//  DataLoader.swift
//  CaloriesCounter
//
//  Created by Ricardo de Agostini Neto on 26/06/24.
//

import Foundation
import UIKit
import RegexBuilder
import SwiftOpenAI

//Possíveis erros que podem dar
enum DataLoaderError: Error {
    case couldNotCreateImageURL
    case couldNotIdentifyPlant
}


/// Sends requests to OpenAI to classify plant images, and returns the result asynchronously
final actor DataLoader {

    /// Uses OpenAI to fetch a description of the image passed as argument
    /// - Parameter image: The image to describe
    /// - Returns: An OpenAI description of the image
    func identify(fromImage image: CGImage) async throws -> String {

        guard let localURL = image.openAILocalURLEncoding() else {
            throw DataLoaderError.couldNotCreateImageURL
        }
        
            
  
        let prompt = "A imagem contém um alimento. Eu desejo saber algumas informações sobre o alimento presente na imagem. Eu quero que voce me de a resposta necessariamente no formato JSON que tenha um name, kcal (quantidade de calorias no alimento presente na imagem), protein (quantidade em gramas de proteína), carb (quantidade em gramas de carboidratos), fat (quantidade em gramas de gordura). Obs: nao quero que voce nao diga nada além do código JSON. Os valores numéricos precisam todos ser números inteiros"
        let messageContent: [ChatCompletionParameters.Message.ContentType.MessageContent] = [.text(prompt), .imageUrl(.init(url: localURL))]
        let parameters = ChatCompletionParameters(messages: [.init(role: .user, content: .contentArray(messageContent))], model: .gpt4o)
        let response = try await AppConstants.openAI.startChat(parameters: parameters)

        let choices = response.choices
        
        //Essa poha é uma string caralhoooooo
        guard let text = choices.first?.message.content else {
            throw DataLoaderError.couldNotIdentifyPlant
        }

        return text
    }
}

extension UIImage {
    
    // Resizeing using CoreGraphics
    func resize(to size:CGSize) -> UIImage? {
        
        let cgImage = self.cgImage!
        let destWidth = Int(size.width)
        let destHeight = Int(size.height)
        let bitsPerComponent = 8
        let bytesPerPixel = cgImage.bitsPerPixel / bitsPerComponent
        let destBytesPerRow = destWidth * bytesPerPixel
        
        let context = CGContext(data: nil,
                                width: destWidth,
                                height: destHeight,
                                bitsPerComponent: bitsPerComponent,
                                bytesPerRow: destBytesPerRow,
                                space: cgImage.colorSpace!,
                                bitmapInfo: cgImage.bitmapInfo.rawValue)!
        context.interpolationQuality = .high
        context.draw(cgImage, in: CGRect(origin: CGPoint.zero, size: size))
        return context.makeImage().flatMap { UIImage(cgImage: $0) }
    }
}


//Função que encoda a CGImage para algo que a API da Open AI consegue ler
private extension CGImage {
    func openAILocalURLEncoding() -> URL? {
        if let data = UIImage(cgImage: self)
            .resize(to: CGSize(width: 200, height: 200))?
            .jpegData(compressionQuality: 0.4) {
        //if let data = UIImage(cgImage: self).jpegData(compressionQuality: 0.4) {
            let base64String = data.base64EncodedString()
            //print(base64String)
            if let url = URL(string: "data:image/jpeg;base64,\(base64String)") {
                print(url)
                return url
            }
        }
        return nil
    }
}
