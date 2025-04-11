//
//  TelaConquistasV2.swift
//  Projeto
//
//  Created by Yago on 07/04/25.
//

import SwiftUI

struct TelaConquistasV2: View {
    
    @State private var tarefas_Exemplo: [Tarefa] = [
        .init(nome: "At1", tipo: "Fazer"),
        .init(nome: "At2", tipo: "Fazer"),
        .init(nome: "At3", tipo: "Fazer"),
        .init(nome: "At4", tipo: "Fazendo"),
        .init(nome: "At5", tipo: "Fazendo"),
        .init(nome: "At6", tipo: "Fazendo"),
        .init(nome: "At7", tipo: "Feito"),
        .init(nome: "At8", tipo: "Feito"),
        .init(nome: "At9", tipo: "Feito")
    ]
    
    @State private var conquistas: [Conquista] = [
        .init(icon: "list.bullet.clipboard.fill", iconColor: .white, mensagem: "Primeiro Dia"),
        .init(icon: "trophy.fill", iconColor: .yellow, mensagem: "1º Tarefa", valor: 1),
        .init(icon: "trophy.fill", iconColor: .yellow, mensagem: "10º Tarefa", valor: 10),
        .init(icon: "trophy.fill", iconColor: .yellow, mensagem: "100º Tarefa", valor: 100),
        .init(icon: "trophy.fill", iconColor: .yellow, mensagem: "1000º Tarefa", valor: 1000)
    ]
    
    var body: some View {
        
        @State var tarefasUsuario = 0
        
        VStack{
            ScrollView {
                
                Card(icon: "flame.fill", text: "\(0) Dias Seguidos")
                
                Title(message: "Tarefas")
                StatusChart(tarefas: tarefas_Exemplo, width: 200, height: 200)
                ChartSubtitlesH()
                ChartSubtitlesNumbers(finalizadas: tarefas_Exemplo.filter { $0.tipo == "Feito" }.count, fazendo: tarefas_Exemplo.filter { $0.tipo == "Feito" }.count, afazer: tarefas_Exemplo.filter { $0.tipo == "Feito" }.count)
                
                Title(message: "Conquistas")
                ForEach(conquistas) { conquista in
                    Achievement(icon: conquista.icon, iconColor: conquista.iconColor, text: conquista.mensagem,tarefasFeitas: tarefasUsuario,valor: conquista.valor ?? 0)
                }
                
            }
        }
        
        
        
    }
}

#Preview {
    TelaConquistasV2()
}
