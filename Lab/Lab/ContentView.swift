//
//  ContentView.swift
//  Lab
//
//  Created by Turma01-25 on 20/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var progresso = 0.0
    
    var body: some View {
        VStack {
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            ProgressView(value: progresso)
        }
        .padding()
    }
    
    func carregar (){
        while(progresso<1.0){
            progresso+=0.1
        }
    }
    
    
}

#Preview {
    ContentView()
}
