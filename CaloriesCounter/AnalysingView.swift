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
    
    let readData = ReadData()
    @State var food = Food(name: "", kcal: 0, protein: 0, carb: 0, fat: 0)
    @State var exibir = false
    
    //food = readData.readData(gptResponse: foodInfo)
    
    var body: some View {
        
        let uiImage = UIImage(cgImage: image)
        
        VStack {
            Image(uiImage: uiImage)
                .resizable()
                .cornerRadius(20)// Permite que a imagem seja redimensionada
                //.aspectRatio(contentMode: .fit)
                .rotationEffect(Angle(degrees: 90))
                .scaledToFit()
                .frame(width: 400, height: 400) // Ajuste conforme necessário
                 // Define o raio da borda arredondada
                .shadow(radius: 10) // Opcional: Adiciona uma sombra à imagem
            
            
            if let foodInfo = classifierManager.caloriesValue {
            } else {
                ProgressView()
            }
            if exibir == true {
                Text(food.name)
                Text("Esse alimento contém aproximadamente \(Int(food.kcal))kcal")
                ChartFoodView(food: food)
                
            }
            
            Spacer()
        }
        .task {
            classifierManager.identify(image)
        }
        .onChange(of: classifierManager.caloriesValue) { newValue in
            if let value = newValue {
                
                let json = readData.extractJSONContent(from: value)
                
                print(json)
                food = readData.readData(gptResponse: json) ?? Food(name: "errei", kcal: 0, protein: 0, carb: 0, fat: 0)
                print(food)
                exibir.toggle()
            }
        }
    }
    
    
    
}
