//
//  ContentView.swift
//  Atividade 4
//
//  Created by Turma01-25 on 21/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            
            VStack {
                
                HStack {
                    Text("Telas").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Image(systemName: "book.pages.fill").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                
                NavigationLink(destination: p1view()) {
                    Text("Modo 1")
                }.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).padding().background(.black).cornerRadius(15).foregroundColor(.white)
                
                
                NavigationLink(destination: p2View()) {
                    Text("Modo 2")
                }.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).padding().background(.black).cornerRadius(15).foregroundColor(.white)
                
                NavigationLink(destination: p3View()) {
                    Text("Modo 3")
                }.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).padding().background(.black).cornerRadius(15).foregroundColor(.white)
            }
            

        }
        
    }
}

#Preview {
    ContentView()
}
