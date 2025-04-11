//
//  ContentView.swift
//  Atividade 1
//
//  Created by Turma01-25 on 19/03/25.
//

import SwiftUI

struct ContentView: View {
    @State var showAlert = false
    @State var name = "Fulano"
    
    var body: some View {
        
        
        ZStack{
            //se remover o frame daqui, e os padding dos elementos no top e bottom fica responsivel, mas com uma borda branca, prefiro sem a borda
            Image("Fundo").resizable().scaledToFill().blur(radius: 5).opacity(0.4).frame(height: 1000)
            
            VStack {
                VStack{
                    Text("Bem vindo, \(name)").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                    TextField("Seu Nome", text: $name).multilineTextAlignment(.center)
                }.padding(.top,120)
                
                Spacer()
                
                Image("Logo").resizable().frame(width:200 ,height: 200)
                
                Spacer()
                
                Button("Entrar") {
                    showAlert = true
                }.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).alert(isPresented: $showAlert) {
                    Alert(title: Text("Alerta!"), message: Text("Voce ira iniciar o desafio da aula agora"), dismissButton: .default(Text("Vamos La \(name)!")))
                }.padding(.bottom,100)
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}
