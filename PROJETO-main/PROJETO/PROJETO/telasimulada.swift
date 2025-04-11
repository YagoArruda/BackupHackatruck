//
//  telasimulada.swift
//  PROJETO
//
//  Created by Turma01-25 on 09/04/25.
//

import SwiftUI



struct telasimulada: View {
    
    @Binding var tasks: [Task]
    
    @Binding var inProgressTasks: [Task]
    @Binding var completedTasks: [Task]
    
    @Binding var counter: Int
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).onAppear(perform: {
            counter = 1
            inProgressTasks = []
            completedTasks = []
            tasks = [
                Task(name: "Apps Revamp", priority: .high, percentageCompleted: "30%", dueDate: "16-11-24"),
                Task(name: "Upload Data", priority: .medium, percentageCompleted: "60%", dueDate: "16-11-24"),
                Task(name: "Crypto UI", priority: .low, percentageCompleted: "90%", dueDate: "16-11-24"),
                Task(name: "Check Stocks", priority: .high, percentageCompleted: "20%", dueDate: "16-11-24"),
                Task(name: "QA Apps", priority: .high, percentageCompleted: "30%", dueDate: "16-11-24"),
                Task(name: "Update Env", priority: .medium, percentageCompleted: "60%", dueDate: "16-11-24"),
                Task(name: "Update Github", priority: .low, percentageCompleted: "90%", dueDate: "16-11-24"),
                Task(name: "Check Github", priority: .high, percentageCompleted: "20%", dueDate: "16-11-24")
            ]

        })
    }
}

//#Preview {
    //telasimulada()
//}
