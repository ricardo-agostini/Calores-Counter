//
//  CaloriesCounterApp.swift
//  CaloriesCounter
//
//  Created by Ricardo de Agostini Neto on 25/06/24.
//

import SwiftUI
import SwiftData

@main
struct CaloriesCounterApp: App {
    
    @State private var classifierManager = ClassifierManager()
    @StateObject private var stackPath = PathType()
    
    var body: some Scene {
        WindowGroup {
            //CameraView(classifierManager: classifierManager)
            InitialView()
        }
        .modelContainer(for: FoodData.self)
        .environmentObject(stackPath)
        
    }
}
