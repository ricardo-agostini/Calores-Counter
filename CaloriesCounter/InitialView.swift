//
//  ContentView.swift
//  CaloriesCounter
//
//  Created by Ricardo de Agostini Neto on 25/06/24.
//

import SwiftUI
import SwiftData


struct InitialView: View {
    
    @State var classifierManager: ClassifierManager = ClassifierManager()
    
//    @Environment(\.modelContext) var modelContext
    @Query var foods: [FoodData]
    
    var body: some View {
        NavigationStack {
        VStack {
            
            NavigationLink(destination: CameraView(classifierManager: classifierManager)) {
                Text("Tirar uma foto")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }

            
            Text("teste")
            
            ForEach(foods) { food in
                Text(food.name)
                Text("\(Int(food.protein))g")
                Text("\(Int(food.carb))g")
                Text("\(Int(food.fat))g")
                
            }
            
        }
        .padding()
        .navigationTitle("MealsLog.AI")
//        .toolbar {
//            Button(action: addSamples, label: {
//                Text("Add Samples")
//            })
//        }
        .navigationBarBackButtonHidden(true)
            
    }


    }
    
//    func addSamples() {
//        let food1 = FoodData(name: "macarrao", kcal: 200, protein: 40, carb: 40, fat: 32)
//        let food2 = FoodData(name: "bife", kcal: 145, protein: 30, carb: 5, fat: 15)
//        modelContext.insert(food1)
//        modelContext.insert(food2)
//    }
    
}

#Preview {
    InitialView()
}
