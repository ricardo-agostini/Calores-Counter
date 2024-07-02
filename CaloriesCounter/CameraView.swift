//
//  CameraView.swift
//  CaloriesCounter
//
//  Created by Ricardo de Agostini Neto on 25/06/24.
//

import SwiftUI

struct CameraView: View {
    
    @StateObject var camera = CameraModel()
    let classifierManager: ClassifierManager
    
    var body: some View {
        NavigationView {
            VStack {
                
                CameraPreview(camera: camera)
                //                .ignoresSafeArea(.all,edges: .all)
                
                Spacer()
                ZStack {
                    Color.black
                        .ignoresSafeArea()
                HStack {
                    
                    if camera.isTaken {
                        
                        Button(action: {camera.reTake()}, label: {
                            
                            Text("Retake")
                                .tint(.white)
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            
                        })
                        .padding(.horizontal, 25)
                        
                        
                        Spacer()
                        
                        NavigationLink {
                            // destination view to navigation to
                            if let finalImage = camera.finalImage {
                                AnalysingView(image: finalImage, classifierManager: classifierManager)
                            }
                        } label: {

                            Text("Analyze")
                                .tint(.white)
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                        }.padding(.horizontal, 25)
                        
                        
                        
                        
                        
                    }
                    else {
                        
                        Button(action: {camera.reTake()}, label: {
                            
                            Text("Cancel")
                                .tint(.white)
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            
                        })
                        .padding(.leading, 25)
                        
                        Spacer()
                        
                        
                        Button(action: camera.takePic,
                               label: {
                            
                            ZStack {
                
                                
                            Circle()
                                .fill(Color.white)
                                .frame(width: 60)
                                
                                Circle()
                                    .stroke(.white, lineWidth: 3)
                                    .frame(width: 70, height: 70)
                                
                                
                                
                            }
                            
                            
                            
                            
                        })
                        Spacer()
                        Spacer()
                    }
                }/*.frame(height: 70)*/
                
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .frame(height: 100)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .frame(height: 100)
            
        }
        //.padding()
        .onAppear(perform: {
            camera.Check()
        })
    }
        
    }
}



//                            Text("Analisar foto")
//                                .foregroundColor(.black)
//                                .fontWeight(.semibold)
//                                .padding(.vertical, 10)
//                                .padding (.horizontal, 20)
//                                .background (Color.white)
//                                .clipShape (Capsule())

//                            Image(systemName: "arrow.triangle.2.circlepath.camera")
//                                .foregroundColor(.black)
//                                .padding()
//                                .background(Color.white)
//                                .clipShape(Circle())
