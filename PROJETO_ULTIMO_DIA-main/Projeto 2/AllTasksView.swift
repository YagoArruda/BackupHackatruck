import SwiftUI

struct AllTasksView: View {
    
    @Binding var counter: Int
    
    @StateObject var dados = ViewModel()
    
    @Binding var tasks: [DadosTarefa]
    @Binding var inProgressTasks: [DadosTarefa]
    @Binding var completedTasks: [DadosTarefa]
    
    
    var body: some View {
        VStack{
            VStack{
                Title(message: "Progresso")
                StatusChart(tasks: $tasks, inProgressTasks: $inProgressTasks, completedTasks: $completedTasks, width: 200, height: 200)
                ChartSubtitlesH()
                Spacer()
                Card(text: "\(counter) Dias Seguidos")
                Spacer()
            }
        }
    }
}
#Preview {
    AllTasksView(counter: .constant(0), tasks: .constant([]), inProgressTasks: .constant([]), completedTasks: .constant([]))
}
