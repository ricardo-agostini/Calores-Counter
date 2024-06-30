//
//  CameraViewModel.swift
//  CaloriesCounter
//
//  Created by Ricardo de Agostini Neto on 29/06/24.
//

import Foundation
import AVFoundation

@Observable
class CameraViewModel {
    
    var session = AVCaptureSession()
    var preview = AVCaptureVideoPreviewLayer()
    var output = AVCapturePhotoOutput()
    
    func requestAccessAndSetup() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { didAllowAccess in
                self.setup() 
            }
        case .authorized:
            setup()
        default:
            print ("other status")
        }
    }
    
    private func setup() {
        session.beginConfiguration()
        session.sessionPreset = AVCaptureSession.Preset.photo
         
        do {
            guard let device = AVCaptureDevice.default(for: .video) else {return}
            let input = try AVCaptureDeviceInput(device: device)
            
            guard session.canAddInput(input) else {return}
            session.addInput(input)
            
            guard session.canAddOutput(output) else {return}
            session.addOutput(output)
            
            session.commitConfiguration()
            
            Task(priority: .background) {
                self.session.startRunning
            }
        }
        catch {
            print(error.localizedDescription)
        }
        
        
        
    }
    
    
}
