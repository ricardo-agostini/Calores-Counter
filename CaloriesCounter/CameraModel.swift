//
//  CameraModel.swift
//  CaloriesCounter
//
//  Created by Ricardo de Agostini Neto on 25/06/24.
//

import Foundation
import AVFoundation
import SwiftUI


class CameraModel: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate {
    
    @Published var isTaken = false
    
    @Published var session = AVCaptureSession()
    
    @Published var alert = false
    
    @Published var output = AVCapturePhotoOutput()
    
    @Published var preview: AVCaptureVideoPreviewLayer!
    
    @Published var picData = Data(count: 0)
    
    @Published var finalImage: UIImage?
    
    func Check() {
        
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            setup()
            return
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) {(status) in
            
            if status {
                self.setup()
            }
        }
        case .denied:
            self.alert.toggle()
            return
    default:
        return
    }
    
}

func setup() {
    
    do {
        
        self.session.beginConfiguration()
        
        
        //Aqui passar um filto para pegra o tipo de câmera que o iphone do usuário possui
        let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
        
        let input = try AVCaptureDeviceInput(device: device!)
        
        if self.session.canAddInput(input) {
            self.session.addInput(input)
        }
        
        if self.session.canAddOutput(self.output) {
            self.session.addOutput(self.output)
        }
        
        self.session.commitConfiguration()
        
    }
    catch {
        print(error.localizedDescription)
    }
}


    func takePic() {
        print("hello")
        DispatchQueue.global(qos: .background).async {
            print("hello2")
            self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
            self.session.stopRunning()
            print("hello3")
            DispatchQueue.main.async {

                    self.isTaken.toggle()
                print("hello4")

            }
            
        }
    }
    
    func reTake() {
        DispatchQueue.global(qos: .background).async {
            self.session.startRunning()
            
            DispatchQueue.main.async {
                //withAnimation {
                    self.isTaken.toggle()
                //}
            }
        }
    }
    
    
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        print("hello5")
        if error != nil {
            return
        }
        
        print("pic taken...")
        print(output)
        
        guard let imageData = photo.fileDataRepresentation() else{return}
        
        self.picData = imageData
        print("gello")
        savePic()
    }
    
    func savePic() {
        
        let image = UIImage(data: self.picData)
        finalImage = image
        print("caiu aqui")
        
    }
    

}
