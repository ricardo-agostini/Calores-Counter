//
//  CameraView.swift
//  CaloriesCounter
//
//  Created by Ricardo de Agostini Neto on 25/06/24.
//

import SwiftUI

struct CameraView: View {
    
    @State private var VM = CameraViewModel()
    
    
    var body: some View {
      
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        cameraPreview
                    }
                    Button(action: {}, label: {
                        Image(systemName: "arrow.triangle.2.circlepath.camera")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                    })
                    .padding(.trailing, 10)
                    
                    
                    
                    
                }
            }
            .padding()
        
    }
    
    
    private var cameraPreview: some View {
        GeometryReader { geo in
            CameraPreview(cameraVM: $VM, frame: geo.frame(in: .global))
                .ignoresSafeArea()
                .onAppear {
                    VM.requestAccessAndSetup()
                }
        }
        
    }
    
    
}

