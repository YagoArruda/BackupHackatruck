//
//  TelaConquistas.swift
//  Projeto
//
//  Created by Turma01-25 on 07/04/25.
//

import SwiftUI

struct TelaConquistas: View {
    
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
        
        ZStack {
        
            
            VStack{
                
                Spacer()
            
                
                VStack{
                    
                    
                    
                    HStack{
                        Image(systemName: "flame.fill")
                            .foregroundColor(.red)
                            .font(.system(size: 40))
                        Text("**0**").font(.system(.title3,design: .rounded))
                        Text("Dias seguidos").font(.system(.title3,design: .rounded))
                    }
                    .frame(width: 280,height: 120)
                    .background(LinearGradient(colors: [Color .F_4_C_9_FF.opacity(0.6), Color .clear], startPoint: .bottom, endPoint: .top))
                    .background(.B_7_C_0_FF)
                    .cornerRadius(20)
                    .padding()
                    .shadow(radius: 10)
                    .foregroundColor(.black)
                    
                    
                    
                    
                    
                    HStack{
                        Text("Tarefas").font(.system(.title2,design: .rounded))
                    }
                    .frame(width: 300,alignment: .leading)
                    
                    Divider().padding(.horizontal)
                    
                    
                    HStack{
                        
                        
                        VStack{
                            Image(systemName: "clipboard.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                            Text("**0**").font(.system(.title3,design: .rounded))
                            //Text("Criadas").font(.system(.title3,design: .rounded))
                        }
                        .frame(width: 120,height: 120)
                        .background(LinearGradient(colors: [Color .F_4_C_9_FF.opacity(0.6), Color .clear], startPoint: .bottom, endPoint: .top))
                        .background(.B_7_C_0_FF)
                        .cornerRadius(20)
                        .padding()
                        .shadow(radius: 10)
                        .foregroundColor(.black)
                        
                        VStack{
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                                .font(.system(size: 40))
                            Text("**0**").font(.system(.title3,design: .rounded))
                            //Text("Finalizadas").font(.system(.title3,design: .rounded))
                        }
                        .frame(width: 120,height: 120)
                        .background(LinearGradient(colors: [Color .F_4_C_9_FF.opacity(0.6), Color .clear], startPoint: .bottom, endPoint: .top))
                        .background(.B_7_C_0_FF)
                        .cornerRadius(20)
                        .padding()
                        .shadow(radius: 10)
                        .foregroundColor(.black)
                        
                    }
                    
                    HStack{
                        Text("Conquistas").font(.system(.title2,design: .rounded))
                    }
                    .frame(width: 300,alignment: .leading)
                    
                    Divider().padding(.horizontal)
                    
                    
                    
                    
                }.frame(width: 380,height: .infinity)
                    .background(Color .F_4_C_9_FF.opacity(0.3).blur(radius: 7))
                
                
                ScrollView {
                    
                    HStack{
                        Image(systemName: "calendar").foregroundColor(.black).shadow(radius: 10)
                        Text("Primeiro dia").font(.system(.title3,design: .rounded))
                    }.frame(width: 200,height: 70)
                    .background(LinearGradient(colors: [Color .F_4_C_9_FF.opacity(0.6), Color .clear], startPoint: .bottom, endPoint: .top))
                    .background(.B_7_C_0_FF)
                    .cornerRadius(100)
                    .padding()
                    .shadow(radius: 10)
                    .foregroundColor(.black)
                    
                    
                    HStack{
                        Image(systemName: "trophy.fill").foregroundColor(.yellow).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        Text("1 Tarefas").font(.system(.title3,design: .rounded))
                    }.frame(width: 200,height: 70)
                    .background(LinearGradient(colors: [Color .F_4_C_9_FF.opacity(0.6), Color .clear], startPoint: .bottom, endPoint: .top))
                    .background(.B_7_C_0_FF)
                    .cornerRadius(100)
                    .padding()
                    .shadow(radius: 10)
                    .foregroundColor(.black)
                    
                    HStack{
                        Image(systemName: "trophy.fill").foregroundColor(.yellow).shadow(radius: 10)
                        Text("10 Tarefas").font(.system(.title3,design: .rounded))
                    }.frame(width: 200,height: 70)
                    .background(LinearGradient(colors: [Color .F_4_C_9_FF.opacity(0.6), Color .clear], startPoint: .bottom, endPoint: .top))
                    .background(.B_7_C_0_FF)
                    .cornerRadius(100)
                    .padding()
                    .shadow(radius: 10)
                    .foregroundColor(.black)
                    
                    HStack{
                        Image(systemName: "trophy.fill").foregroundColor(.yellow).shadow(radius: 10)
                        Text("100 Tarefas").font(.system(.title3,design: .rounded))
                    }.frame(width: 200,height: 70)
                    .background(LinearGradient(colors: [Color .F_4_C_9_FF.opacity(0.6), Color .clear], startPoint: .bottom, endPoint: .top))
                    .background(.B_7_C_0_FF)
                    .cornerRadius(100)
                    .padding()
                    .shadow(radius: 10)
                    .foregroundColor(.black)
                    
                    
                }
                //.frame(width: 380,height: 300)
                //.background(.D_1_C_6_FF)
                
                
                
            }
        }
        
    }
}

#Preview {
    TelaConquistas()
}
