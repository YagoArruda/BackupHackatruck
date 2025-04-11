//
//  Model.swift
//  Projeto
//
//  Created by Yago on 04/04/25.
//  Edited 07/04/25
//

import Foundation
import SwiftUI
import Charts

#Preview {
    ChartSubtitlesNumbers(finalizadas: 1, fazendo: 1, afazer: 1)
}

struct Tarefa: Identifiable {
    let id = UUID()
    let nome: String
    let tipo: String
}

struct Tipos: Identifiable {
    let id = UUID()
    let tipo: String
    var porcentagem: Int
    let cor: Color
}

struct Conquista: Identifiable {
    let id = UUID()
    let icon: String
    let iconColor: Color
    let mensagem: String
    var valor: Int?
}


struct StatusChart: View{
    
    @State var tarefas: [Tarefa]
    @State private var tipos: [Tipos] = []
    
    @State var width: CGFloat
    @State var height: CGFloat
    
    
    var body: some View{
        
        VStack {
        

            Chart(tipos) { tipo in
                SectorMark(
                    angle: .value(
                        Text(verbatim: tipo.tipo),
                        tipo.porcentagem
                    ),
                    innerRadius: .ratio(0.45),
                    angularInset: 5
                    
                )
                .foregroundStyle(tipo.cor)
                .shadow(color: .gray, radius: 1, x: 5, y: 7)
                .cornerRadius(100)
                
                
            }.frame(width: width,height: height)
                .shadow(radius: 10)
                .onAppear(perform: {
                    
                tipos = [
                    .init(tipo: "Fazer", porcentagem: tarefas.filter { $0.tipo == "Fazer" }.count, cor: Color.F_4_C_9_FF),
                    .init(tipo: "Fazendo", porcentagem: tarefas.filter { $0.tipo == "Fazendo" }.count, cor: Color.D_1_C_6_FF),
                    .init(tipo: "Feito", porcentagem: tarefas.filter { $0.tipo == "Feito" }.count, cor: Color.B_7_C_0_FF),
                ]})

        
        }
        .padding(20)
        
    }
    
}


struct ChartSubtitlesH: View{
    
    var body: some View{
        
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
        
    }
    
}

struct ChartSubtitlesV: View{
    
    var body: some View{
        
        VStack{
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
        
    }
    
}

struct ChartSubtitlesNumbers: View{
    
    @State var finalizadas: Int
    @State var fazendo: Int
    @State var afazer: Int
    
    var body: some View{
        
        HStack{
            HStack{
                Rectangle()
                    .frame(width: 15,height: 15)
                    .foregroundColor(.B_7_C_0_FF)
                    .cornerRadius(10)
                Text("\(finalizadas)")
                Divider().frame(height: 30)
            }
            
            HStack{
                Rectangle()
                    .frame(width: 15,height: 15)
                    .foregroundColor(.D_1_C_6_FF)
                    .cornerRadius(10)
                Text("\(fazendo)")
                Divider().frame(height: 30)
            }
            
            HStack{
                Rectangle()
                    .frame(width: 15,height: 15)
                    .foregroundColor(.F_4_C_9_FF)
                    .cornerRadius(10)
                Text("\(afazer)")
            }
        }
        
    }
    
}

struct Title: View{
    
    @State var message: String
    
    var body: some View{
        
        HStack{
            Text("**\(message)**").font(.system(.title2,design: .rounded))
        }
        .frame(width: 300,alignment: .leading)
        
        Divider().padding(.horizontal)
        
    }
    
}

struct Card: View{
    
    @State var icon: String
    @State var text: String
    
    var body: some View{
        
        HStack{
            Image(systemName: icon)
                .foregroundColor(.red)
                .font(.system(size: 40))
            Text("**\(text)**").font(.system(.title3,design: .rounded))
        }
        .frame(width: 280,height: 120)
        .background(.D_1_C_6_FF.opacity(0.9))
        .cornerRadius(20)
        .padding()
        .shadow(radius: 10)
        .foregroundColor(.black)
        
    }
    
}

struct Achievement: View{
    
    @State var icon: String
    @State var iconColor: Color
    @State var text: String
    @State var tarefasFeitas: Int
    @State var valor: Int
    
    var body: some View{
        
        if(tarefasFeitas>=valor){
            HStack{
                Image(systemName: icon).foregroundColor(iconColor).shadow(radius: 10)
                Text("**\(text)**").font(.system(.title3,design: .rounded))
            }.frame(width: 200,height: 70)
            .background(LinearGradient(colors: [Color .F_4_C_9_FF.opacity(0.6), Color .clear], startPoint: .bottom, endPoint: .top))
            .background(.B_7_C_0_FF)
            .cornerRadius(100)
            .padding()
            .shadow(radius: 10)
            .foregroundColor(.black)
        }
        else{
            HStack{
                Image(systemName: icon).foregroundColor(iconColor).shadow(radius: 10)
                Text("**\(text)**").font(.system(.title3,design: .rounded))
            }.frame(width: 200,height: 70)
            .background(LinearGradient(colors: [Color .F_4_C_9_FF.opacity(0.6), Color .clear], startPoint: .bottom, endPoint: .top))
            .background(.B_7_C_0_FF)
            .cornerRadius(100)
            .padding()
            .shadow(radius: 10)
            .foregroundColor(.black)
            .colorMultiply(.gray)
        }
        

        
    }
    
}

   // .background(LinearGradient(colors: [Color .F_4_C_9_FF.opacity(0.6), Color .clear], startPoint: .bottom, endPoint: .top))
