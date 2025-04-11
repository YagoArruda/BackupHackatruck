//
//  DataView.swift
//  Atividade 7
//
//  Created by Turma01-25 on 26/03/25.
//

import SwiftUI

struct DataView: View {
    
    @State var nome: String
    
    var body: some View {
        Text(nome)
    }
}

#Preview {
    DataView(nome: "teste")
}
