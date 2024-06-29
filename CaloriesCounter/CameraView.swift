//
//  CameraView.swift
//  CaloriesCounter
//
//  Created by Ricardo de Agostini Neto on 25/06/24.
//

import SwiftUI

struct CameraView: View {
    
    @StateObject var camera = CameraModel()
//    let classifierManager: ClassifierManager
    
    var body: some View {
        NavigationView {
        ZStack {
            
            CameraPreview(camera: camera)
                .ignoresSafeArea(.all,edges: .all)
            
            VStack {
                if camera.isTaken {
                HStack {
                    Spacer()
                    
                        Button(action: {camera.reTake()}, label: {
                            Image(systemName: "arrow.triangle.2.circlepath.camera")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                        })
                        .padding(.trailing, 10)
                    }
                }
                
                Spacer()
                
                HStack {
                    
                    if camera.isTaken {
//                        Button(action: {
//                            
//                            camera.isTaken.toggle()
//                            //AnalysingView(image: camera.output)
//                            
//                            
//                        }, label: {
//                            Text("Analisar foto")
//                            
//                                .foregroundColor(.black)
//                                .fontWeight(.semibold)
//                                .padding(.vertical, 10)
//                                .padding (.horizontal, 20)
//                                .background (Color.white)
//                                .clipShape (Capsule())
//                            
//                        }).padding (.leading)
                        
                        NavigationLink {
                            // destination view to navigation to
                            if let finalImage = camera.finalImage {
                                AnalysingView(image: finalImage/*, classifierManager: classifierManager*/)
                            }
                        } label: {
                            Text("Analisar foto")
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .padding(.vertical, 10)
                                .padding (.horizontal, 20)
                                .background (Color.white)
                                .clipShape (Capsule())

                        }.padding(.leading)
 
                    }
                    else {
                        Button(action: camera.takePic,
                               label: {
                            
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 70, height: 70)
                            }
                        })
                    }
                }.frame(height: 70)
            }
        }
        .padding()
        .onAppear(perform: {
            camera.Check()
        })
    }
        
    }
}

