//
//  DragAndDropDestination.swift
//  Projeto
//
//  Created by Turma01-28 on 09/04/25.
//

import SwiftUI

struct DragAndDropDestination: View {
    @State private var tasks: [Task] = [
        Task(name: "Apps Revamp", priority: .high, dueDate: "16-11-24", times: .manha),
        Task(name: "Upload Data", priority: .medium, dueDate: "16-11-24", times: .tarde),
        Task(name: "Crypto UI", priority: .low, dueDate: "16-11-24", times: .tarde)
    ]
    
    @State private var inProgressTasks: [Task] = []
    @State private var completedTasks: [Task] = []
    
    @State private var isTargetedManha = false
    @State private var isTargetedTarde = false
    @State private var isTargetedNoite = false
    @State private var isTargetedToDo = false
    @State private var isTargetedDoing = false
    @State private var isTargetedDone = false
    @State private var currentPage: Int = 0

    var body: some View {
        
        VStack(spacing: 0) {
            // Sticky Navbar
            ZStack{
                HStack {
                    Spacer()
                    Button("A fazer") {
                        withAnimation {
                            currentPage = 0
                        }
                    }
                    .bold(currentPage == 0) // Bold when active
                    .font(.title2)
                    .scaleEffect(currentPage == 0 ? 1.2 : 1) // Grow when active
                    .foregroundStyle(currentPage == 0 ? .red : .black)
                    Spacer()
                    Button("Fazendo") {
                        withAnimation {
                            currentPage = 1
                        }
                    }
                    .bold(currentPage == 1) // Bold when active
                    .font(.title2)
                    .scaleEffect(currentPage == 1 ? 1.2 : 1) // Grow when active
                    .foregroundStyle(currentPage == 1 ? .yellow : .black)
                    Spacer()
                    Button("Feito") {
                        withAnimation {
                            currentPage = 2
                        }
                    }
                    .bold(currentPage == 2) // Bold when active
                    .font(.title2)
                    .scaleEffect(currentPage == 2 ? 1.2 : 1) // Grow when active
                    .foregroundStyle(currentPage == 2 ? .green : .black)
                    Spacer()
                }
                
                .ignoresSafeArea()
            }
            .padding(15)
            .background(.gray.opacity(0.2))
            
            
            // Scrollable content with sections
            ScrollViewReader { proxy in
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        VStack {
                            VStack {
                                VStack {
                                    ScrollView(.vertical, showsIndicators: false) {
                                        LazyVStack {
                                            ForEach(tasks, id: \.self) { task in
                                                TaskView(name: task.name, priority: task.priority, dueDate: task.dueDate)
                                                    .draggable(task)
                                            }
                                        }
                                        .padding()
                                    }
                                    .dropDestination(for: Task.self) { droppedTask, location in
                                        for task in droppedTask {
                                            tasks.removeAll{$0.name == task.name}
                                            inProgressTasks.removeAll { $0.name == task.name }
                                            completedTasks.removeAll { $0.name == task.name
                                            }
                                        }
                                        tasks.insert(contentsOf: droppedTask, at: 0)
                                        return true
                                    } isTargeted: { isOver in
                                        isTargetedToDo = isOver
                                    }
                                    .background(isTargetedToDo ? .vermelho.opacity(0.8) : .vermelho.opacity(0.6))
                                }
                                .scaleEffect(isTargetedToDo ? 1.05 : 1)
                                .animation(.easeInOut, value: isTargetedToDo)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width - 0)
                        .scrollTargetLayout()
                        .id(0)
                        
                        VStack {
                            VStack (alignment: .leading) {
                                Text("Manhã")
                                    .bold()
                                    .font(.title3)
                                    .padding(.leading)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHStack {
                                        ForEach(inProgressTasks.filter { $0.times == .manha }, id: \.self) { task in
                                            
                                                TaskView(name: task.name, priority: task.priority, dueDate: task.dueDate)
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
                                        ForEach(inProgressTasks.filter { $0.times == .tarde }, id: \.self) { task in
                                                TaskView(name: task.name, priority: task.priority, dueDate: task.dueDate)
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
                                        ForEach(inProgressTasks.filter { $0.times == .noite }, id: \.self) { task in
                                                TaskView(name: task.name, priority: task.priority, dueDate: task.dueDate)
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
                        .id(1)
                        
                        VStack {
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
                        .id(2)
                        
                    }
                }
                .onChange(of: currentPage) { newPage in
                    withAnimation {
                        proxy.scrollTo(newPage, anchor: .center)
                    }
                }
                .scrollTargetBehavior(.paging)
                .scrollIndicators(.hidden)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                
                
            }
            
        }
        
        .onAppear {
            currentPage = 0
        }
        
    }
}

#Preview {
    DragAndDropDestination()
}

