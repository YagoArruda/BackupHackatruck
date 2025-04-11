//
//  ChartView.swift
//  Projeto
//
//  Created by Yago on 04/04/25.
//

import SwiftUI

struct ChartView: View {
    
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
    
    var body: some View {
       
        VStack{
            
            Spacer()
            
            StatusChart(tarefas: tarefas_Exemplo, width: 200, height: 200)
            
            
            HStack{
                HStack{
                    Rectangle()
                        .frame(width: 15,height: 15)
                        .foregroundColor(.B_7_C_0_FF)
                        .cornerRadius(10)
                    Text("Finalizadas")
                }
                
                HStack{
                    Rectangle()
                        .frame(width: 15,height: 15)
                        .foregroundColor(.D_1_C_6_FF)
                        .cornerRadius(10)
                    Text("Fazendo")
                }
                
                HStack{
                    Rectangle()
                        .frame(width: 15,height: 15)
                        .foregroundColor(.F_4_C_9_FF)
                        .cornerRadius(10)
                    Text("A Fazer")
                }
            }
             
            Spacer()
            
            
        }
        
    }
}

#Preview {
    ChartView()
}
