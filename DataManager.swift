//
//  DataManager.swift
//  CaloriesCounter
//
//  Created by Ricardo de Agostini Neto on 26/06/24.
//

import SwiftUI

//@MainActor
@Observable
final class ClassifierManager {
    /// The description of a plant. Descriptions are generated by OpenAI
    private(set) var caloriesValue: String?

    /// The image of a plant. This camera image is supplied by the user
    private(set) var image: CGImage?

    /// Loads data from OpenAI
    private let classifierDataLoader = DataLoader()

    /// Identify a plant based on a passed in image
    /// - Parameter image: a camera frame that the user took of a plant in their surroundings
    func identify(_ image: CGImage) {
        self.image = image
        Task {
            caloriesValue = nil
            
            
            let calories = try await classifierDataLoader.identify(fromImage: image)
            self.caloriesValue = calories
            print(caloriesValue!)
        }
    }
    
    /// Reset all previously classified state
    func reset() {
        self.caloriesValue = nil
        self.image = nil
    }
}



