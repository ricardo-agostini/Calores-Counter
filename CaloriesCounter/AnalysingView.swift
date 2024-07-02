//
//  AnalysingView.swift
//  CaloriesCounter
//
//  Created by Ricardo de Agostini Neto on 26/06/24.
//

import SwiftUI

struct AnalysingView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @State private var isNavigationActive = false
    
    @State var image: CGImage
    let classifierManager: ClassifierManager
    
    let readData = ReadData()
    @State var food = Food(name: "", kcal: 0, protein: 0, carb: 0, fat: 0)
    @State var foodData = FoodData(name: "", kcal: 0, protein: 0, carb: 0, fat: 0)
    @State var exibir = false
    
    //food = readData.readData(gptResponse: foodInfo)
    
    var body: some View {
        
        let uiImage = UIImage(cgImage: image)
        ScrollView {
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
                    
//                    NavigationLink(destination: InitialView()) {
//                        Text("Cadastrar Alimento")
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Color.blue)
//                            .cornerRadius(8)
//                    }
                    
                    Button(action: {
                                    saveFood()
                                    isNavigationActive = true
                                }) {
                                    Text("Voltar para Tela 1")
                                }
                                .background(
                                    NavigationLink(destination: InitialView(), isActive: $isNavigationActive) {
                                        EmptyView()
                                    }
                                    .hidden()
                                )
                    
                    
                    
                    
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
    
    func saveFood() {
        foodData.name = food.name
        foodData.kcal = food.kcal
        foodData.carb = food.carb
        foodData.protein = food.protein
        foodData.fat = food.fat
    
        modelContext.insert(foodData)
    }
    
    
}







