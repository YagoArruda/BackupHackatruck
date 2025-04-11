//
//  ContentView3.swift
//  Teste_19_3
//
//  Created by Turma01-25 on 19/03/25.
//

import SwiftUI

struct ContentView3: View {
    @State var popShow = false
    
    var body: some View {
        Text("...")
        Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
            popShow = !popShow
        }.padding().border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/).popover(isPresented: $popShow) {
            Text("Your content here")
                .font(.headline)
                .padding()
        }
        ProgressView(value: 0.5).padding()
    }
}

#Preview {
    ContentView3()
}
