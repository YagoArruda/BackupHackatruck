//
//  AchievementView.swift
//  Projeto
//
//  Created by Turma01-25 on 07/04/25.
//

import SwiftUI

struct AchievementView: View {
    
    
    @Binding var completedTasks: [Task]
    
    @StateObject var dados = configModel()
    
    var body: some View {
        
            ZStack {
                Color.gray.opacity(0.2)
                    .ignoresSafeArea()
                VStack {
                    Title(message: "Conquistas")
                ScrollView {
                    
                    ForEach(lista_conquistas) { conquista in
                        Achievement(tarefasFeitas: completedTasks.count, conquista: conquista)
                    }
                    
                }
            }
        }.onAppear(perform: {
            dados.fetch()
        })
        
        
    }
}

#Preview {
    AchievementView(completedTasks: .constant([]))
}
