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
//        ScrollView {
        List {
            
            
            Section {
                Image(uiImage: uiImage)
                    .resizable()
                    .cornerRadius(20)
                    .rotationEffect(Angle(degrees: 90))
                    .scaledToFit()
                    .frame(width: 400, height: 400)
                    .listRowSeparator(.hidden)
                if exibir {
                    Text("This meal contains approximately \(Int(food.kcal)) Kcal")
                        .fontDesign(.rounded)
                        .listRowSeparator(.hidden)
                        .frame(alignment: .center)
                }
            }
                .listRowBackground(Color.clear)

            
                
                if let foodInfo = classifierManager.caloriesValue {
                } else {
                    Section {
                        HStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                    }.listRowBackground(Color.clear)
                }
            if exibir == true {
                Section(header:
                            Text("Meal Macros")
                    .font(.title3) // Ajuste o tamanho da fonte aqui
                    .foregroundColor(.black)
                                .fontWeight(.bold) // Ajuste o peso da fonte aqui
                    .textCase(nil)
                        ) {
                    Text("The Chart bellow shows the quantity in grams of each macronutrient present in the meal in the detected image")
                        .frame(alignment: .leading)
                        .fontDesign(.rounded)
                    ChartFoodView(food: food)
                }
                
            }
            
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
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Your Meal")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button(action: {
                        saveFood()
                        isNavigationActive = true
                    }) {Text("Add Meal")}
                        .background(
                            NavigationLink(destination: InitialView(), isActive: $isNavigationActive) {
                                EmptyView()
                            }
                                .hidden()
                        )
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







