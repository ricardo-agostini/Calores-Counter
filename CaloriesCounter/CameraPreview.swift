//
//  CameraPreview.swift
//  CaloriesCounter
//
//  Created by Ricardo de Agostini Neto on 25/06/24.
//

import Foundation
import SwiftUI
import AVFoundation

struct CameraPreview: UIViewRepresentable {
    
    @ObservedObject var camera: CameraModel
    
    func makeUIView(context: Context) -> UIView {
        
        let view = UIView(frame: UIScreen.main.bounds)
        
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        // Your Own Properties...
        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer (camera.preview)
        
        
         DispatchQueue.global(qos: .background).async {
             camera.session.startRunning()
         }
        
        return view
    }
    
    
    
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
}
