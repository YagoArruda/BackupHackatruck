//
//  p1view.swift
//  Atividade 4
//
//  Created by Turma01-25 on 21/03/25.
//

import SwiftUI

struct p1view: View {
    var body: some View {
        ZStack {
            Color.teal.ignoresSafeArea()
            VStack {
                Image(systemName: "paperplane.circle.fill").resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100).colorInvert()
                
                Text("Volte!").colorInvert().font(.title)
            }.padding()
        }

    }
}

#Preview {
    p1view()
}
