//
//  TotalChartView.swift
//  CaloriesCounter
//
//  Created by Ricardo de Agostini Neto on 03/07/24.
//

import SwiftUI
import Charts

struct NutrientData: Identifiable {
    var id = UUID()
    var category: String
    var amount: Double
}

struct TotalChartView: View {
    
    var total: FoodData
    
    var body: some View {
        let data = [
            NutrientData(category: "Protein", amount: total.protein),
            NutrientData(category: "Carb", amount: total.carb),
            NutrientData(category: "Fat", amount: total.fat)
        ]
        
        Chart(data, id: \.id) { item in
            SectorMark(
                angle: .value("Amount", item.amount),
                innerRadius: .ratio(0.6),
                angularInset: 2
            )
            .cornerRadius(5)
            .foregroundStyle(by: .value("Category", item.category))
        }
        .frame(width: 250, height: 250)
        .scaledToFit()
        .chartLegend(.hidden)
        .chartForegroundStyleScale([
            "Protein": .blue,
            "Carb": .red,
            "Fat": Color(red: 219/255, green: 177/255, blue: 39/255)
        ])
    }
}
