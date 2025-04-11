//
//  ContentView.swift
//  Teste_19_3
//
//  Created by Turma01-25 on 19/03/25.
//

import SwiftUI

struct ContentView: View {
    
    
    
    var body: some View {
        VStack{
            HStack(alignment: .top) {
                Rectangle().frame(width:100,height:100)
                    .foregroundColor(.red)
                Spacer()
                Rectangle().frame(width:100,height:100)
                    .foregroundColor(.blue)
            }
            .padding()
            
            Spacer()
            
            HStack(alignment: .bottom){
                Rectangle().frame(width:100,height:100)
                .foregroundColor(.green)
                Spacer()
                Rectangle().frame(width:100,height:100)
                .foregroundColor(.yellow)
            }
            .padding()
        }
        
        
    }
}

//Instanciar Preview
#Preview {
    ContentView()
}
