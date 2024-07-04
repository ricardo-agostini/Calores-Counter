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
    @Query var foods: [FoodData]
    
    var body: some View {
        NavigationStack {
            
            List {

                Section("Todays Macros"){
                    TotalDayCard(total: sumTotal())
                }
                
                Section ("meals"){
                    
                    ForEach(foods) { food in
                        MealCard(name: food.name, kcal: food.kcal, protein: food.protein, carbs: food.carb, fat: food.fat)
                        
                    }
                }
            }
            .navigationTitle("MealsLog.AI")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    NavigationLink(destination: CameraView(classifierManager: classifierManager)) {
                        Text("Add Meal")
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            
        }
    }
    
    func sumTotal() -> FoodData {
        var total: FoodData = FoodData(name: "", kcal: 0, protein: 0, carb: 0, fat: 0)
        for meal in foods {
            total.kcal = total.kcal + meal.kcal
            total.protein = total.protein + meal.protein
            total.carb = total.carb + meal.carb
            total.fat = total.fat + meal.fat
        }
        return total
    }
}

#Preview {
    InitialView()
}
