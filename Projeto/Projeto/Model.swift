//
//  Model.swift
//  Projeto
//
//  Created by Turma01-25 on 02/04/25.
//

import Foundation
import SwiftUI
import Charts


struct ProgressBox: View{
    @Binding var progress: CGFloat //= 0.5
    var width: CGFloat //= 300
    var height: CGFloat //= 12
    var CRadius: CGFloat //= 10
    
    var body: some View{
        
        ZStack(alignment: .leading){
            
            //Barra fundo
            RoundedRectangle(cornerRadius: CRadius)
                .frame(width: width,height: height)
            //Barra progresso
            RoundedRectangle(cornerRadius: CRadius)
                .frame(width: progress * width, height: height)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.red,.yellow]),startPoint: .leading, endPoint: .trailing))
        }
        .padding(20)
        
    }
    
}




//Text(Date.now.formatted(date: .numeric, time: .omitted))

#Preview {
    
   StatusChart(tarefas: [.init(nome: "At1", tipo: "Fazer"),
                         .init(nome: "At2", tipo: "Fazendo"),
                         .init(nome: "At3", tipo: "Feito"),
                         .init(nome: "At3", tipo: "Feito"),
                         .init(nome: "At2", tipo: "Fazendo")], width: 300, height: 300)
}
