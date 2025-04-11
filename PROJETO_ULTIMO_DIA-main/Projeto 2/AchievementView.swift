import SwiftUI

struct AchievementView: View {
    
    @StateObject var dados = ViewModel()
    
    @Binding var completedTasks: [DadosTarefa]
    
    var body: some View {
        
            ZStack {
                Color.gray.opacity(0.2)
                    .ignoresSafeArea()
                VStack {
                    Title(message: "Conquistas")
                ScrollView {
                    
                    ForEach(lista_conquistas) { conquista in
                        Achievement(tarefasFeitas: 1, conquista: conquista)
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
