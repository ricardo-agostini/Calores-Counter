//
//  TotalDayCard.swift
//  CaloriesCounter
//
//  Created by Ricardo de Agostini Neto on 03/07/24.
//

import SwiftUI

struct TotalDayCard: View {
    
    var total: FoodData
    
    var body: some View {
        
        VStack(spacing: 8) {
            
            Text("Total of Calories: \(Int(total.kcal)) Kcal")
                
            
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
        }
    }
}
