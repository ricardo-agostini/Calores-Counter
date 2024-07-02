//
//  ChartFoodView.swift
//  CaloriesCounter
//
//  Created by Ricardo de Agostini Neto on 01/07/24.
//

import Foundation
import SwiftUI
import Charts

struct ChartFoodView: View {
    
    var food: Food
    
    
    var body: some View {
                GroupBox {
        
        VStack(alignment: .leading)  {
            Text("Macronutrients")
                .font(.callout)
                .foregroundStyle(.secondary)
            
            Chart {
                BarMark(x: .value("Type", "Protein"),
                        y: .value("Population", food.protein))
                
                BarMark(x: .value("Type", "Carbohydrate"),
                        y: .value("Population", food.carb))
                
                BarMark(x: .value("Type", "Fat"),
                        y: .value("Population", food.fat))
                
            }
            .aspectRatio(1, contentMode: .fit)
            .padding()
            .chartYAxis {
                AxisMarks(position: .leading, values: .automatic) { value in
                    AxisGridLine(centered: true, stroke: StrokeStyle(lineWidth: 1))
                    AxisValueLabel() {
                        if let intValue = value.as(Int.self) {
                            Text("\(intValue) g")
                            .font(.system(size: 10))
                        }
                    }
                }
            }
        }
    }
    
    }

}

#Preview {
    ChartFoodView(food: Food(name: "Macarrão", kcal: 200, protein: 31, carb: 7, fat: 1))
}
