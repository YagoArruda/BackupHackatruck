//
//  ContentView2.swift
//  Teste_19_3
//
//  Created by Turma01-25 on 19/03/25.
//

import SwiftUI

struct ContentView2: View {
    var body: some View {
        HStack{
            //Circle().fill().frame(width:100,alignment: .leading).padding(20)
            
            Image("foto").resizable().clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).scaledToFit()
            
            VStack(spacing: 10) {
                Text("Hackatruck").foregroundStyle(Color(.red))
                Text("77 Universidades").foregroundStyle(Color(.blue))
                Text("5 Regiões do Brasil").foregroundStyle(Color(.orange))
            }
        }.padding()
    }
}

#Preview {
    ContentView2()
}
