import SwiftUI

struct CreateTaskView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var tarefa = ""
    @State private var date = Date.now
    @State private var selection = ""
    @State private var periodos = ""
    let periodo = ["", "Manhã", "Tarde", "Noite"]
    let prioridade = ["", "Baixa", "Média", "Alta"]
    @StateObject var vm = ViewModel()
    @State var formatter = DateFormatter()
    @State var irParaNavegacao = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Form{
                    VStack{
                        DatePicker("Data da tarefa",
                                   selection: $date)
                        .datePickerStyle(CompactDatePickerStyle())
                        .frame(maxHeight: 400)
                    }
                    
                    Picker("Período", selection: $periodos) {
                        ForEach(periodo, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    Picker("Prioridade", selection: $selection) {
                        ForEach(prioridade, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    TextField("Digite sua tarefa aqui", text: $tarefa, axis: .vertical)
                        .padding()
                    
                    Button("Criar"){
                        let formatter = DateFormatter()
                        formatter.dateStyle = .short
                        vm.post(DadosTarefa(name: tarefa, priority: selection, dueDate: formatter.string(from: date), times: periodos))
                        irParaNavegacao = true
                        dismiss()
                    }
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(10)
                    .bold()
                    
                }
                .navigationTitle("Criar Tarefa")
                
            }
        }
    }
}


#Preview {
    CreateTaskView()
}
