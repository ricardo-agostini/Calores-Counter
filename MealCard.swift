//
//  MealCard.swift
//  CaloriesCounter
//
//  Created by Ricardo de Agostini Neto on 03/07/24.
//

import SwiftUI

struct MealCard: View {
    
    @State var name: String
    @State var kcal: Double
    @State var protein: Double
    @State var carbs: Double
    @State var fat: Double
    
    
    var body: some View {
        VStack {
//            RoundedRectangle(cornerRadius: 25)
//                .fill(Color.gray.opacity(0.2))
//                .frame(maxWidth: .infinity)
//                .overlay(
                    VStack(alignment: .center, spacing: 8) {
                        Text(name)
                            .font(.headline)
                             HStack {
                                 
                                 VStack {
                                     Text("\(Int(kcal)) kcal")
                                     Text("Total Calories")
                                     
                                 }
                                 
                                 Spacer()
                                 
                                 VStack {
                                     Text("\(Int(protein))g")
                                         .foregroundStyle(Color.blue)
                                     Text("Protein")
                                         .foregroundStyle(Color.blue)
                                     
                                 }
                                 
                                 
                                 VStack {
                                     Text("\(Int(protein))g")
                                         .foregroundStyle(Color.blue)
                                     Text("Protein")
                                         .foregroundStyle(Color.blue)
                                     
                                 }
                                 Spacer()
                                 VStack {
                                     Text("\(Int(carbs))g")                                         .foregroundStyle(Color.red)
                                     Text("Carbs")
                                         .foregroundStyle(Color.red)
                                     
                                 }
                                 Spacer()
                                 VStack {
                                     Text("\(Int(fat))g")                                         .foregroundStyle(Color.yellow)
                                     Text("Fat")
                                         .foregroundStyle(Color.yellow)
                                     
                                 }
                        }
                    }
                        .padding(8)
                //)
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
    }
}

#Preview {
    MealCard(name: "arroz", kcal: 2, protein: 2, carbs: 2, fat: 2)
}
