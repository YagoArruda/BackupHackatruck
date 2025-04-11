//
//  AllTasksView.swift
//  Projeto
//
//  Created by Turma01-28 on 09/04/25.
//

import SwiftUI

struct AllTasksView: View {
    
    
    @Binding var tasks: [Task]
    @Binding var inProgressTasks: [Task]
    @Binding var completedTasks: [Task]
    
    @Binding var counter:Int
    
    @StateObject var dados = configModel()
    
    
    var body: some View {
        VStack{
            
            ZStack {
                Color.gray.opacity(0.2)
                    .ignoresSafeArea()
                VStack{
                    Title(message: "Tarefas")
                    StatusChart(tasks: tasks, inProgressTasks: inProgressTasks, completedTasks: completedTasks, width: 200, height: 200)
                    ChartSubtitlesH()
                    Spacer()
                    Card(text: "\(counter) Dias Seguidos")
                    Spacer()
                }
            }
        }.onAppear(perform: {
            dados.fetch()
        })
    }
}
#Preview {
    AllTasksView(tasks: .constant([Task(name: "teste", priority: .high, dueDate: "22/22/22", times: .manha)]), inProgressTasks: .constant([Task(name: "teste", priority: .high, dueDate: "22/22/22", times: .manha)]), completedTasks: .constant([Task(name: "teste", priority: .high, dueDate: "22/22/22", times: .manha)]), counter: .constant(0))
}
