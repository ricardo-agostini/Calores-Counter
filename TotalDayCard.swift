//
//  TotalDayCard.swift
//  CaloriesCounter
//
//  Created by Ricardo de Agostini Neto on 03/07/24.
//

import SwiftUI

struct TotalDayCard: View {
    
    
    var array: [FoodData]
    var total: FoodData = FoodData(name: "", kcal: 0, protein: 0, carb: 0, fat: 0)
    
    var body: some View {
        
        
        VStack {
           
            Text("Total of Calories: \(Int(total.kcal)) Kcal")
                .padding()
            
            TotalChartView(total: total)
            
            HStack {
                VStack {
                    Text("\(Int(total.protein))g")
                        .foregroundStyle(Color.blue)
                    Text("Protein")
                        .foregroundStyle(Color.blue)
                        .fontWeight(.semibold)
                    
                }
                
                Spacer()
                
                VStack {
                    Text("\(Int(total.carb))g")                                         
                        .foregroundStyle(Color.red)
                    Text("Carbs")
                        .foregroundStyle(Color.red)
                        .fontWeight(.semibold)
                }
                
                Spacer()
                
                VStack {
                    Text("\(Int(total.fat))g")
                        .foregroundStyle(Color(red: 219/255, green: 177/255, blue: 39/255))
                    Text("Fat")
                        .foregroundStyle(Color(red: 219/255, green: 177/255, blue: 39/255))
                        .fontWeight(.semibold)
                }
                
                
            }
            .padding()
            
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
        .onAppear(perform: {
            sumTotal()
        })
        
    }
    
    
    func sumTotal() {
        for meal in array {
            total.kcal = total.kcal + meal.kcal
            total.protein = total.protein + meal.protein
            total.carb = total.carb + meal.carb
            total.fat = total.fat + meal.fat
        }
    }
    
    
}
