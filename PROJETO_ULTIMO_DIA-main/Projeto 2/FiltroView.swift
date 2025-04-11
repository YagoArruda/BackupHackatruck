import SwiftUI

struct FiltroView: View {
    @StateObject var tarefa = ViewModel()
    @State private var intervaloDias: Int = 5
    
    var body: some View {
        NavigationStack {
            VStack {
                Title(message: "Datas")
                ScrollView {
                    
                    VStack(spacing: 20) {
                        Image("TarefaIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .overlay(
                                Circle()
                                    .stroke(Color.black, lineWidth: 4)
                            )
                            .padding(.top)
                        VStack {
                            
                            Text("Mostrar tarefas com até \(intervaloDias) dia(s) restantes")
                                .font(.headline)
                            Stepper("Dias antes do término", value: $intervaloDias, in: 1...30)
                                .labelsHidden()
                        }
                        .padding(5)
                        .frame(width: UIScreen.main.bounds.width - 20)
                        .background(.lilas.opacity(0.5))
                        .cornerRadius(10)
                        
                        
                        //Puxando a lista e estilizando
                        ForEach(tarefasComIntervalo(), id: \.self) { item in
                            VStack(alignment: .leading, spacing: 8) {
                                Text(item.name)
                                    .font(.headline)
                                Text("Data: \(item.dueDate ?? "--")")
                                    .font(.subheadline)
                                Text("Período: \(item.times)")
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, minHeight: 120, maxHeight: 120, alignment: .leading)
                            .background(Color(.lilas))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.purple, lineWidth: 4)
                            )
                            .cornerRadius(12)
                            .shadow(color: .purple.opacity(0.3), radius: 4, x: 0, y: 2)
                        }
                    }
                    .padding()
                }
                .onAppear {
                    tarefa.fetch()
                }
            }
        }
    }
    
    func tarefasComIntervalo() -> [DadosTarefa] {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        
        let hoje = Date()
        
        return tarefa.tasks.filter { tarefa in
            if let dataStr = tarefa.dueDate,
               let data = formatter.date(from: dataStr) {
                let diasRestantes = Calendar.current.dateComponents([.day], from: hoje, to: data).day ?? 0
                return diasRestantes <= intervaloDias && diasRestantes >= 0
            }
            return false
        }
    }
}

#Preview {
    FiltroView()
}
