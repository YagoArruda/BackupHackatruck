import SwiftUI

struct StreakCounter: View {
    @State private var counter = 0 // Contador
    
    var body: some View {
        NavigationView {
            ZStack {
                // Texto exibindo o valor do contador
                // Botão que incrementa o contador e navega para a próxima tela
                NavigationLink(destination: telagraficoefoguuinho(tasks: .constant([]), inProgressTasks: .constant([]), completedTasks: .constant([]),counter: $counter)) {
                    Text("Autenticar")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .simultaneousGesture(TapGesture().onEnded {
                                    // Incrementa o contador quando o NavigationLink é pressionado
                                    counter += 1
                                })
            }
            .navigationTitle("Tela de Login")
        }
    }
}

#Preview {
    StreakCounter()
}
