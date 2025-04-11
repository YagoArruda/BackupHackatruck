//
//  ContentView.swift
//  Projeto
//
//  Created by Turma01-25 on 02/04/25.
//

import SwiftUI


struct ContentView: View {
        
    
    var body: some View {
        
        ZStack {
            
            Color(.cor6F49A0).edgesIgnoringSafeArea(.top)

            TabView {
                    
                    ViewTeste().tabItem {
                        Text("Aba 1")
                        Image(systemName: "paperplane.circle.fill")
                    }
                    ViewTeste2().tabItem {
                        Text("Aba 2")
                        Image(systemName: "apple.terminal.circle.fill")
                    }
                    ViewTeste().tabItem {
                        Text("Aba 3")
                        Image(systemName: "personalhotspot.circle.fill")
                    }

            }.background(.red)


        }
        
    }
}

#Preview {
    ContentView()
}
