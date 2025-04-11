//
//  p3View.swift
//  Atividade 4
//
//  Created by Turma01-25 on 21/03/25.
//

import SwiftUI

struct p3View: View {
    
    @State var apresentar = true
    
    var body: some View {
        Text("Sheet view!").sheet(isPresented: $apresentar) {
            Text("Arraste")
            Image(systemName: "square.and.arrow.down.on.square.fill").resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
        }

    }
}

#Preview {
    p3View()
}
