//
//  ContentView.swift
//  Atividade 9
//
//  Created by Turma01-25 on 28/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        
        ZStack {
            
            Color .black.edgesIgnoringSafeArea(.all)
            
            LinearGradient (gradient: Gradient(colors: [ Color .blue.opacity( 0.8 ), Color .clear]), startPoint: .top, endPoint: .bottom)
                .frame(height: 900 )
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image(systemName: "sailboat.fill").resizable().frame(width: 100 ,height: 100).scaledToFit()
                    .foregroundStyle(.purple)
                //Text("**.lock.shield.fill**").font(.title).foregroundStyle(.white)
                //ailboat.fill
            }
            .padding()
            
        }
        
        
        
    }
}

#Preview {
    ContentView()
}
