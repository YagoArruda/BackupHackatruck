//
//  AchievementView.swift
//  Projeto
//
//  Created by Yago on 07/04/25.
//  Edited 09/04/25
//

import SwiftUI

struct AchievementView: View {
    
    @Binding var tasks: [Task]
    @Binding var inProgressTasks: [Task]
    @Binding var completedTasks: [Task]
    
    @Binding var counter:Int
    
    @StateObject var dados = configModel()
    
    //Lista fixa criada no arquivo ChartModel
    @State private var conquistas = lista_conquistas
    
    var body: some View {
        
        
        VStack{
            ScrollView {
                
                FlameCard(text: "\(counter) Dias Seguidos")
                
                Title(message: "Tarefas")
                StatusChart(tasks: tasks, inProgressTasks: inProgressTasks, completedTasks: completedTasks, width: 200, height: 200)
                ChartSubtitlesH()
                ChartSubtitlesNumbers(tasks: tasks, inProgressTasks: inProgressTasks, completedTasks: completedTasks)
                
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
    AchievementView(tasks: .constant([Task(name: "Apps Revamp", priority: .high, percentageCompleted: "30%", dueDate: "16-11-24")]), inProgressTasks: .constant([Task(name: "Apps Revamp", priority: .high, percentageCompleted: "30%", dueDate: "16-11-24")]), completedTasks: .constant([Task(name: "Apps Revamp", priority: .high, percentageCompleted: "30%", dueDate: "16-11-24")]), counter: .constant(0))
}
