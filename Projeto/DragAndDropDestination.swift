//
//  DragAndDropDestination.swift
//  Projeto
//
//  Created by Turma01-28 on 09/04/25.
//

import SwiftUI

struct DragAndDropDestination: View {
    @State private var tasks: [Task] = [
        Task(name: "Apps Revamp", priority: .high, percentageCompleted: "30%", dueDate: "16-11-24"),
        Task(name: "Upload Data", priority: .medium, percentageCompleted: "60%", dueDate: "16-11-24"),
        Task(name: "Crypto UI", priority: .low, percentageCompleted: "90%", dueDate: "16-11-24"),
        Task(name: "Check Stocks", priority: .high, percentageCompleted: "20%", dueDate: "16-11-24"),
        Task(name: "QA Apps", priority: .high, percentageCompleted: "30%", dueDate: "16-11-24"),
        Task(name: "Update Env", priority: .medium, percentageCompleted: "60%", dueDate: "16-11-24"),
        Task(name: "Update Github", priority: .low, percentageCompleted: "90%", dueDate: "16-11-24"),
        Task(name: "Check Github", priority: .high, percentageCompleted: "20%", dueDate: "16-11-24")
    ]
    
    @State private var inProgressTasks: [Task] = []
    @State private var completedTasks: [Task] = []
    
    @State private var isTargetedManha = false
    @State private var isTargetedTarde = false
    @State private var isTargetedNoite = false
    @State private var isTargetedToDo = false
    @State private var isTargetedDoing = false
    @State private var isTargetedDone = false

    var body: some View {
        
        VStack {
            // Sticky Navbar
            HStack {
                Spacer()
                Button("To Do") {
                    withAnimation {
                        currentPage = 0
                    }
                }
                Spacer()
                Button("Fazendo") {
                    withAnimation {
                        currentPage = 1
                    }
                }
                Spacer()
                Button("Done") {
                    withAnimation {
                        currentPage = 2
                    }
                }
                Spacer()
            }
            .padding()
            .background(Color.white.opacity(0.9))
            .frame(maxWidth: .infinity)
            .shadow(radius: 5)
            
            // Scrollable content with sections
            ScrollViewReader { proxy in
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        VStack {
                            Text("To Do")
                                .bold()
                                .font(.title2)
                                .padding()
                            VStack {
                                VStack {
                                    ScrollView(.vertical, showsIndicators: false) {
                                        LazyVStack {
                                            ForEach(tasks, id: \.self) { task in
                                                TaskView(name: task.name, priority: task.priority, percentageCompleted: task.percentageCompleted, dueDate: task.dueDate)
                                                    .draggable(task)
                                            }
                                        }
                                        .padding()
                                    }
                                    .dropDestination(for: Task.self) { droppedTask, location in
                                        for task in droppedTask {
                                            tasks.removeAll{$0.name == task.name}
                                            inProgressTasks.removeAll { $0.name == task.name }
                                            completedTasks.removeAll { $0.name == task.name }
                                        }
                                        tasks.insert(contentsOf: droppedTask, at: 0)
                                        return true
                                    } isTargeted: { isOver in
                                        isTargetedToDo = isOver
                                    }
                                    .background(isTargetedToDo ? .red.opacity(0.8) : .red.opacity(0.6))
                                }
                                .scaleEffect(isTargetedToDo ? 1.05 : 1)
                                .animation(.easeInOut, value: isTargetedToDo)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width - 0)
                        .scrollTargetLayout()
                        .id(0)
                        
                        VStack {
                            
                            Text("Fazendo")
                                .bold()
                                .font(.title2)
                                .padding()
                            VStack (alignment: .leading) {
                                Text("Manhã")
                                    .bold()
                                    .font(.title3)
                                    .padding(.leading)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHStack {
                                        ForEach(inProgressTasks, id: \.self) { task in
                                            TaskView(name: task.name, priority: task.priority, percentageCompleted: task.percentageCompleted, dueDate: task.dueDate)
                                                .draggable(task)
                                        }
                                    }
                                    .padding([.trailing, .leading], 5)
                                }
                                .dropDestination(for: Task.self) { droppedTask, location in
                                    for task in droppedTask {
                                        tasks.removeAll{$0.name == task.name}
                                        inProgressTasks.removeAll { $0.name == task.name }
                                        completedTasks.removeAll { $0.name == task.name }
                                    }
                                    inProgressTasks.insert(contentsOf: droppedTask, at: 0)
                                    return true
                                } isTargeted: { isOver in
                                    isTargetedManha = isOver
                                }
                                .background(isTargetedManha ? .yellow.opacity(0.8) : .yellow.opacity(0.6))
                            }
                            .scaleEffect(isTargetedManha ? 1.05 : 1)
                            .animation(.easeInOut, value: isTargetedManha)
                            .padding(0)
                            
                            VStack (alignment: .leading) {
                                Text("Tarde")
                                    .bold()
                                    .font(.title3)
                                    .padding(.leading)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHStack {
                                        ForEach(inProgressTasks, id: \.self) { task in
                                            TaskView(name: task.name, priority: task.priority, percentageCompleted: task.percentageCompleted, dueDate: task.dueDate)
                                                .draggable(task)
                                        }
                                    }
                                    .padding([.trailing, .leading], 5)
                                }
                                .dropDestination(for: Task.self) { droppedTask, location in
                                    for task in droppedTask {
                                        tasks.removeAll{$0.name == task.name}
                                        inProgressTasks.removeAll { $0.name == task.name }
                                        completedTasks.removeAll { $0.name == task.name }
                                    }
                                    inProgressTasks.insert(contentsOf: droppedTask, at: 0)
                                    return true
                                } isTargeted: { isOver in
                                    isTargetedTarde = isOver
                                }
                                .background(isTargetedTarde ? .orange.opacity(0.8) : .orange.opacity(0.6))
                            }
                            .scaleEffect(isTargetedTarde ? 1.05 : 1)
                            .animation(.easeInOut, value: isTargetedTarde)
                            .padding(0)
                            
                            VStack (alignment: .leading) {
                                Text("Noite")
                                    .bold()
                                    .font(.title3)
                                    .padding(.leading)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHStack {
                                        ForEach(inProgressTasks, id: \.self) { task in
                                            TaskView(name: task.name, priority: task.priority, percentageCompleted: task.percentageCompleted, dueDate: task.dueDate)
                                                .draggable(task)
                                        }
                                    }
                                    .padding([.trailing, .leading], 5)
                                }
                                .dropDestination(for: Task.self) { droppedTask, location in
                                    for task in droppedTask {
                                        tasks.removeAll{$0.name == task.name}
                                        inProgressTasks.removeAll { $0.name == task.name }
                                        completedTasks.removeAll { $0.name == task.name }
                                    }
                                    inProgressTasks.insert(contentsOf: droppedTask, at: 0)
                                    return true
                                } isTargeted: { isOver in
                                    isTargetedNoite = isOver
                                }
                                .background(isTargetedNoite ? .purple.opacity(0.8) : .purple.opacity(0.6))
                            }
                            .scaleEffect(isTargetedNoite ? 1.05 : 1)
                            .animation(.easeInOut, value: isTargetedNoite)
                            .padding(0)
                            
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        .scrollTargetLayout()
                        
                        VStack {
                            Text("Done")
                                .bold()
                                .font(.title2)
                                .padding()
                            VStack {
                                VStack {
                                    ScrollView(.vertical, showsIndicators: false) {
                                        LazyVStack {
                                            ForEach(completedTasks, id: \.self) { task in
                                                CompletedView(name: task.name)
                                                    .draggable(task)
                                            }
                                        }
                                        .padding()
                                    }
                                    .dropDestination(for: Task.self) { droppedTask, location in
                                        for task in droppedTask {
                                            tasks.removeAll{$0.name == task.name}
                                            inProgressTasks.removeAll { $0.name == task.name }
                                            completedTasks.removeAll { $0.name == task.name }
                                        }
                                        completedTasks.insert(contentsOf: droppedTask, at: 0)
                                        return true
                                    } isTargeted: { isOver in
                                        isTargetedDone = isOver
                                    }
                                    .background(isTargetedDone ? .green.opacity(0.8) : .green.opacity(0.6))
                                }
                                .scaleEffect(isTargetedDone ? 1.05 : 1)
                                .animation(.easeInOut, value: isTargetedDone)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        .scrollTargetLayout()
                        
                    }
                    
                } // Ensures Rectangle occupies the full width
                .scrollTargetBehavior(.paging)
                .scrollIndicators(.hidden)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.gray.opacity(0.2))
            }
        }
        
    }
        
}

#Preview {
    DragAndDropDestination()
}

