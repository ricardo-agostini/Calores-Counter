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
            
            HStack {
                Text("Meals of the Day")
                    .bold()
                    .font(.system(size: 22))
                    .padding(.top)
                Spacer()
            }
            
            ForEach(foods) { food in
                MealCard(name: food.name, kcal: food.kcal, protein: food.protein, carbs: food.carb, fat: food.fat)

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
    

    
}

#Preview {
    InitialView()
}
