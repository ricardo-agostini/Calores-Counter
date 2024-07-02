//
//  PathType.swift
//  CaloriesCounter
//
//  Created by Ricardo de Agostini Neto on 02/07/24.
//

import Foundation

class PathType: ObservableObject {
    @Published var path: [Views]
    init(){
        self.path = []
    }
}

enum Views {
    case InitialView, CameraView, AnalysingView

}
