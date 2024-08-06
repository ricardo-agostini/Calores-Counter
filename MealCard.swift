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
            
            VStack(alignment: .leading, spacing: 16) {
                Text(name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .font(.system(size: 16))
                HStack {
                    VStack(alignment: .leading) {
                        Text("Total Calories")
                            .fontWeight(.semibold)
                            .font(.system(size: 14))
                        HStack(spacing: 4) {
                            Text("\(Int(kcal))")
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                            Text("Kcal")
                                .fontWeight(.semibold)
                                .fontDesign(.rounded)
                                .foregroundStyle(Color.gray)
                        }
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("Protein")
                            .fontWeight(.semibold)
                            .font(.system(size: 14))
                            .foregroundStyle(Color.blue)
                        HStack(spacing: 4) {
                            Text("\(Int(protein))")
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                            Text("g")
                                .fontWeight(.semibold)
                                .fontDesign(.rounded)
                                .foregroundStyle(Color.gray)
                        }
                    }
                    
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Carbs")
                            .fontWeight(.semibold)
                            .font(.system(size: 14))
                            .foregroundStyle(Color.green)
                        HStack(spacing: 4) {
                            Text("\(Int(carbs))")                        .fontWeight(.bold)
                                .fontDesign(.rounded)
                            Text("g")
                                .fontWeight(.semibold)
                                .fontDesign(.rounded)
                                .foregroundStyle(Color.gray)
                        }

                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Fat")
                            .fontWeight(.semibold)
                            .font(.system(size: 14))
                            .foregroundStyle(Color.red)
                        HStack(spacing: 4) {
                            Text("\(Int(fat))")
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
            .padding(8)
            //)
        }
        .cornerRadius(8)
    }
}

#Preview {
    MealCard(name: "arroz", kcal: 200, protein: 2, carbs: 2, fat: 2)
}
