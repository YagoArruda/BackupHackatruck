//
//  FiltroView.swift
//  Projeto
//
//  Created by Turma01-28 on 09/04/25.
//

import SwiftUI

struct FiltroView: View {
    @StateObject var tarefa = configModel()
    @State private var intervaloDias: Int = 5
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.2)
                    .ignoresSafeArea()
                VStack {
                    Title(message: "Tarefas")
                    ScrollView {
                        
                        VStack(spacing: 20) {
                            
                            VStack {
                                Text("Mostrar tarefas com até \(intervaloDias) dia(s) restantes")
                                    .font(.headline)
                                Stepper("Dias antes do término", value: $intervaloDias, in: 1...30)
                                    .labelsHidden()
                            }
                            .padding(5)
                            .frame(width: UIScreen.main.bounds.width - 20)
                            .background(.white.opacity(0.5))
                            .cornerRadius(10)
                            
                            
                            //Puxando a lista e estilizando
                            ForEach(tarefasComIntervalo(), id: \.self) { item in
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(item.tarefa ?? "Sem nome")
                                        .font(.headline)
                                    Text("Data: \(item.date ?? "--")")
                                        .font(.subheadline)
                                    Text("Período: \(item.selection ?? "Não definido")")
                                        .font(.subheadline)
                                        .foregroundColor(.black)
                                }
                                .padding()
                                .frame(maxWidth: .infinity, minHeight: 120, maxHeight: 120, alignment: .leading)
                                .background(Color(.orange))
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
    }
    
    func tarefasComIntervalo() -> [Tarefa] {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        
        let hoje = Date()
        //let hoje = formatter.date(from: "01/05/25") ?? Date()


        return tarefa.tarefas.filter { tarefa in
            if let dataStr = tarefa.date,
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
