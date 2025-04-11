//
//  ContentView.swift
//  Atividade 10
//
//  Created by Turma01-25 on 01/04/25.
//

import SwiftUI


struct ContentView: View {
    
    //let umidades = UmidClass()
    @StateObject var viewmodel = ViewModel()
    
    @State var umidade = 0.0
    
    func teste(entrada:Double){
        umidade = entrada
    }
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Image(systemName: "humidifier.and.droplets.fill").resizable().frame(width: 100, height: 200).scaledToFit()
                .foregroundStyle(.tint)
            
            Text("**0.0%**").font(.title)
            
            Spacer()
            Spacer()
            
        }
        .padding().onAppear(){
            viewmodel.fetch()
        }
    }
}

#Preview {
    ContentView()
}
