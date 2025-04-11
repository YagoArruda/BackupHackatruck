//
//  telagraficoefoguuinho.swift
//  PROJETO
//
//  Created by Turma01-25 on 09/04/25.
//

import SwiftUI

struct telagraficoefoguuinho: View {
    
    @Binding var tasks: [Task]
    @Binding var inProgressTasks: [Task]
    @Binding var completedTasks: [Task]
    
    @Binding var counter:Int
    
    
    var body: some View {
        
        VStack{
            
            FlameCard(text: "\(counter) Dias Seguidos")
            
            Title(message: "Tarefas")
            StatusChart(tasks: tasks, inProgressTasks: inProgressTasks, completedTasks: completedTasks, width: 200, height: 200)
            ChartSubtitlesH()
            ChartSubtitlesNumbers(tasks: tasks, inProgressTasks: inProgressTasks, completedTasks: completedTasks)
            
        }
        
    }
}

#Preview {
    telagraficoefoguuinho(tasks: .constant([]), inProgressTasks: .constant([]), completedTasks: .constant([]), counter: .constant(0))
}
