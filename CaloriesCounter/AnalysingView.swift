//
//  AnalysingView.swift
//  CaloriesCounter
//
//  Created by Ricardo de Agostini Neto on 26/06/24.
//

import SwiftUI

struct AnalysingView: View {
    
    @State var image: CGImage
    let classifierManager: ClassifierManager
    
    var body: some View {
        
        let uiImage = UIImage(cgImage: image)
        
        VStack {
            Image(uiImage: uiImage)
                .resizable() // Permite que a imagem seja redimensionada
                //.aspectRatio(contentMode: .fit)
                .rotationEffect(Angle(degrees: 90))
            Text("passou")
            if let foodInfo = classifierManager.caloriesValue {
                
                Text(foodInfo)
                
                
                
            } else {
                ProgressView()
            }

        }
        .task {
            classifierManager.identify(image)
        }
    }
    
    
    
}
