//
//  FoodModel.swift
//  CaloriesCounter
//
//  Created by Ricardo de Agostini Neto on 01/07/24.
//

import Foundation

struct Food: Codable {
    var name: String
    var kcal: Double
    var protein: Double
    var carb: Double
    var fat: Double

}
