//
//  p2View.swift
//  Atividade 4
//
//  Created by Turma01-25 on 21/03/25.
//

import SwiftUI

struct p2View: View {
    @State var name = "Nome"
    
    var body: some View {
        NavigationView{
            
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    Text(name).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).colorInvert()
                    
                    TextField("Seu Nome", text: $name).multilineTextAlignment(.center).background().cornerRadius(15).frame(width: 200)
                    
                    
                    
                    NavigationLink(destination: p4View(name: name)) {
                        Text("Seguir")
                    }.padding().foregroundColor(.white).background(.black).cornerRadius(15)
                }.padding().background(.pink).cornerRadius(15)
                
            }
                

        }
    }
}

#Preview {
    p2View()
}
