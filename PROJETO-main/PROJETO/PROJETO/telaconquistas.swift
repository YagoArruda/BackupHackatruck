//
//  telaconquistas.swift
//  PROJETO
//
//  Created by Turma01-25 on 09/04/25.
//

import SwiftUI

struct telaconquistas: View {
    
    @Binding var completedTasks: [Task]
    
    @State private var conquistas = lista_conquistas
    
    @StateObject var dados = configModel()
    
    var body: some View {
        
        VStack{
            ScrollView {
                
                Title(message: "Conquistas")
                ForEach(conquistas) { conquista in
                    Achievement(tarefasFeitas: completedTasks.count, conquista: conquista)
                }
                
            }
        }.onAppear(perform: {
            dados.fetch()
        })
        

        
    }
}

#Preview {
    telaconquistas(completedTasks: .constant([]))
}
