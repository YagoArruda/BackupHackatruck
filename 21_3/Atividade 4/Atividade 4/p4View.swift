//
//  p4View.swift
//  Atividade 4
//
//  Created by Turma01-25 on 21/03/25.
//

import SwiftUI

struct p4View: View {
    
    @State var name = ""
    
    var body: some View {
        Text("Ola, \(name)")
        Image(systemName: "fireworks").foregroundColor(.red).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding()
    }
}

#Preview {
    p4View(name: "")
}
