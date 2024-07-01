//
//  CaloriesCounterApp.swift
//  CaloriesCounter
//
//  Created by Ricardo de Agostini Neto on 25/06/24.
//

import SwiftUI

@main
struct CaloriesCounterApp: App {
    
    @State private var classifierManager = ClassifierManager()
    
    var body: some Scene {
        WindowGroup {
            CameraView(classifierManager: classifierManager)
        }
    }
}
