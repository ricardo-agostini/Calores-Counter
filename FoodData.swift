//
//  FoodData.swift
//  CaloriesCounter
//
//  Created by Ricardo de Agostini Neto on 02/07/24.
//

import Foundation
import SwiftData



@Model
class FoodData {
    var name: String
    var kcal: Double
    var protein: Double
    var carb: Double
    var fat: Double
    
    init(name: String, kcal: Double, protein: Double, carb: Double, fat: Double) {
        self.name = name
        self.kcal = kcal
        self.protein = protein
        self.carb = carb
        self.fat = fat
    }
    
}
