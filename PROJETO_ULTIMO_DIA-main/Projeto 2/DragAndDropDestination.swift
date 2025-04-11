import SwiftUI



struct DragAndDropDestination: View {
    
    
    @State var tasks: [DadosTarefa] = []
    @State var inProgressTasks: [DadosTarefa] = []
    @State var completedTasks: [DadosTarefa] = []
    
    @StateObject var tarefas = ViewModel()
    
    @State private var isTargetedManha = false
    @State private var isTargetedTarde = false
    @State private var isTargetedNoite = false
    @State private var isTargetedToDo = false
    @State private var isTargetedDoing = false
    @State private var isTargetedDone = false
    @State private var currentPage: Int = 0

    var body: some View {
        
        VStack(spacing: 0)  {
            HStack {
                Spacer()
                Button("A fazer") {
                    withAnimation {
                        currentPage = 0
                    }
                }
                .bold(currentPage == 0)
                .font(.title2)
                .scaleEffect(currentPage == 0 ? 1.2 : 1)
                .foregroundStyle(currentPage == 0 ? .afazer : .black)
                Spacer()
                Button("Fazendo") {
                    withAnimation {
                        currentPage = 1
                    }
                }
                .bold(currentPage == 1)
                .font(.title2)
                .scaleEffect(currentPage == 1 ? 1.2 : 1)
                .foregroundStyle(currentPage == 1 ? .fazendo : .black)
                Spacer()
                Button("Feito") {
                    withAnimation {
                        currentPage = 2
                    }
                }
                .bold(currentPage == 2)
                .font(.title2)
                .scaleEffect(currentPage == 2 ? 1.2 : 1)
                .foregroundStyle(currentPage == 2 ? .feito : .black)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(15)
            
            ScrollViewReader { proxy in
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        VStack {
                            VStack {
                                VStack {
                                    ScrollView(.vertical, showsIndicators: false) {
                                        LazyVStack {
                                            ForEach(tasks, id: \.self) { task in
                                                TaskView(name: task.name, priority: task.priority, dueDate: task.dueDate ?? "-")
                                                    .draggable(task)
                                            }
                                        }
                                        .padding()
                                    }
                                    .dropDestination(for: DadosTarefa.self) { droppedTask, location in
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
                                    .background(isTargetedToDo ? .afazer.opacity(0.8) : .afazer.opacity(0.6))
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
                                        ForEach(inProgressTasks.filter { $0.times == "Manhã" }, id: \.self) { task in
                                            
                                            TaskView(name: task.name, priority: task.priority, dueDate: task.dueDate ?? "-")
                                                    .draggable(task)
                                        }
                                    }
                                    .padding([.trailing, .leading], 5)
                                }
                                .dropDestination(for: DadosTarefa.self) { droppedTask, location in
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
                                .background(isTargetedManha ? .manha.opacity(0.8) : .manha.opacity(0.6))
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
                                        ForEach(inProgressTasks.filter { $0.times == "Tarde" }, id: \.self) { task in
                                                TaskView(name: task.name, priority: task.priority, dueDate: task.dueDate ?? "-")
                                                    .draggable(task)
                                        }
                                    }
                                    .padding([.trailing, .leading], 5)
                                }
                                .dropDestination(for: DadosTarefa.self) { droppedTask, location in
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
                                .background(isTargetedTarde ? .tarde.opacity(0.8) : .tarde.opacity(0.6))
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
                                        ForEach(inProgressTasks.filter { $0.times == "Noite" }, id: \.self) { task in
                                                TaskView(name: task.name, priority: task.priority, dueDate: task.dueDate ?? "-")
                                                    .draggable(task)
                                        }
                                    }
                                    .padding([.trailing, .leading], 5)
                                }
                                .dropDestination(for: DadosTarefa.self) { droppedTask, location in
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
                                .background(isTargetedNoite ? .roxoBase.opacity(0.8) : .roxoBase.opacity(0.6))
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
                                    .dropDestination(for: DadosTarefa.self) { droppedTask, location in
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
            .onAppear {
                tarefas.fetch()
                tasks = tarefas.tasks
                currentPage = 0
            }
        }
        .onChange(of: tarefas.tasks) { i in
            tasks = i
            print(tasks)
        }
    }
}

#Preview {
    DragAndDropDestination()
}

