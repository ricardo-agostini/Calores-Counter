//
//  ContentView.swift
//  CaloriesCounter
//
//  Created by Ricardo de Agostini Neto on 25/06/24.
//

import SwiftUI

struct InitialView: View {
    var body: some View {
        VStack {
            
            Button(action: {
                // Ação do botão
            }) 
            {
                Text("Tirar uma foto")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

#Preview {
    InitialView()
}
