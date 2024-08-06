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
            HStack(spacing: 4) {
                Text("Total of Calories:")
                    .fontWeight(.semibold)
                    .font(.system(size: 16))
                HStack(spacing: 4) {
                Text("\(Int(total.kcal))")
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                Text("Kcal")
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                    .foregroundStyle(Color.gray)
            }
                
            }

            TotalChartView(total: total)
            
            HStack {
//                VStack {
//                    Text("\(Int(total.protein))g")
//                        .foregroundStyle(Color.blue)
//                    Text("Protein")
//                        .foregroundStyle(Color.blue)
//                        .fontWeight(.semibold)
//                    
//                }
                
                VStack(alignment: .leading) {
                    Text("Protein")
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                        .foregroundStyle(Color.blue)
                    HStack(spacing: 4) {
                        Text("\(Int(total.protein))")
                            .fontWeight(.bold)
                               .fontDesign(.rounded)
                        Text("g")
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                            .foregroundStyle(Color.gray)
                    }
                }

                Spacer()
                
//                VStack {
//                    Text("\(Int(total.carb))g")
//                        .foregroundStyle(Color.red)
//                    Text("Carbs")
//                        .foregroundStyle(Color.red)
//                        .fontWeight(.semibold)
//                }
                
                VStack(alignment: .leading) {
                    Text("Carbs")
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                        .foregroundStyle(Color.green)
                    HStack(spacing: 4) {
                        Text("\(Int(total.carb))")
                            .fontWeight(.bold)
                            .fontDesign(.rounded)
                        Text("g")
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                            .foregroundStyle(Color.gray)
                    }
                }
                
                
                Spacer()
                
//                VStack {
//                    Text("\(Int(total.fat))g")
//                        .foregroundStyle(Color(red: 219/255, green: 177/255, blue: 39/255))
//                    Text("Fat")
//                        .foregroundStyle(Color(red: 219/255, green: 177/255, blue: 39/255))
//                        .fontWeight(.semibold)
//                }
                
                VStack(alignment: .leading) {
                    Text("Fat")
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                        .foregroundStyle(Color.red)
                    HStack(spacing: 4) {
                        Text("\(Int(total.fat))")
                            .fontWeight(.bold)
                               .fontDesign(.rounded)
                        Text("g")
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                            .foregroundStyle(Color.gray)
                    }
                }
                
                
                
                
            }
        }
    }
}
