////
////  DataLoader.swift
////  CaloriesCounter
////
////  Created by Ricardo de Agostini Neto on 26/06/24.
////
//
//import Foundation
//import UIKit
//import RegexBuilder
//import SwiftOpenAI
//
////Possíveis erros que podem dar
//enum DataLoaderError: Error {
//    case couldNotCreateImageURL
//    case couldNotIdentifyPlant
//}
//
//
///// Sends requests to OpenAI to classify plant images, and returns the result asynchronously
//final actor DataLoader {
//
//    /// Uses OpenAI to fetch a description of the image passed as argument
//    /// - Parameter image: The image to describe
//    /// - Returns: An OpenAI description of the image
//    func identify(fromImage image: CGImage) async throws -> String {
//
//        guard let localURL = image.openAILocalURLEncoding() else {
//            throw DataLoaderError.couldNotCreateImageURL
//        }
//  
//        let prompt = "What kind of plant is this? Give me the name"
//        let messageContent: [ChatCompletionParameters.Message.ContentType.MessageContent] = [.text(prompt), .imageUrl(.init(url: localURL))]
//        let parameters = ChatCompletionParameters(messages: [.init(role: .user, content: .contentArray(messageContent))], model: .gpt4o)
//        let response = try await AppConstants.openAI.startChat(parameters: parameters)
//
//        let choices = response.choices
//        
//        //Essa poha é uma string caralhoooooo
//        guard let text = choices.first?.message.content else {
//            throw DataLoaderError.couldNotIdentifyPlant
//        }
//
//        return text
//    }
//}
//
//
////Função que encoda a CGImage para algo que a API da Open AI consegue ler
//private extension CGImage {
//    func openAILocalURLEncoding() -> URL? {
//        if let data = UIImage(cgImage: self).jpegData(compressionQuality: 0.4) {
//            let base64String = data.base64EncodedString()
//            if let url = URL(string: "data:image/jpeg;base64,\(base64String)") {
//                return url
//            }
//        }
//        return nil
//    }
//}
