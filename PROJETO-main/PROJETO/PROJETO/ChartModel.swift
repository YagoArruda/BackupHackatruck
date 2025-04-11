//
//  Model.swift
//  Projeto
//
//  Created by Yago on 04/04/25.
//  Edited 09/04/25
//

import Foundation
import SwiftUI
import Charts
import SDWebImageSwiftUI
import UniformTypeIdentifiers

#Preview {
    FlameCard(text:"0 Dias Seguidos")
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

var lista_conquistas: [Conquista] = [
    .init(icon: "list.bullet.clipboard.fill", iconColor: .white, mensagem: "Primeiro Dia"),
    .init(icon: "trophy.fill", iconColor: .yellow, mensagem: "1º Tarefa", valor: 1),
    .init(icon: "trophy.fill", iconColor: .yellow, mensagem: "5º Tarefa", valor: 5),
    .init(icon: "trophy.fill", iconColor: .yellow, mensagem: "10º Tarefa", valor: 10),
    .init(icon: "trophy.fill", iconColor: .yellow, mensagem: "50º Tarefa", valor: 50),
    .init(icon: "trophy.fill", iconColor: .yellow, mensagem: "100º Tarefa", valor: 100),
    .init(icon: "trophy.fill", iconColor: .yellow, mensagem: "500º Tarefa", valor: 500),
    .init(icon: "trophy.fill", iconColor: .yellow, mensagem: "1000º Tarefa", valor: 1000),
    .init(icon: "trophy.fill", iconColor: .yellow, mensagem: "5000º Tarefa", valor: 5000),
    .init(icon: "trophy.fill", iconColor: .yellow, mensagem: "10000º Tarefa", valor: 10000),
    .init(icon: "trophy.fill", iconColor: .yellow, mensagem: "∞º Tarefa", valor: 99999)
]

struct StatusChart: View{
    
    @State var tasks: [Task]
    @State var inProgressTasks: [Task]
    @State var completedTasks: [Task]
    
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
                    .init(tipo: "Fazer", porcentagem: tasks.count, cor: Color.manha),
                    .init(tipo: "Fazendo", porcentagem: inProgressTasks.count, cor: Color.tarde),
                    .init(tipo: "Feito", porcentagem: completedTasks.count, cor: Color.noite),
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
                    .foregroundColor(.noite)
                    .cornerRadius(10)
                Text("Finalizadas")
            }
            
            HStack{
                Rectangle()
                    .frame(width: 15,height: 15)
                    .foregroundColor(.tarde)
                    .cornerRadius(10)
                Text("Fazendo")
            }
            
            HStack{
                Rectangle()
                    .frame(width: 15,height: 15)
                    .foregroundColor(.manha)
                    .cornerRadius(10)
                Text("A Fazer")
            }
        }
        
    }
    
}

struct ChartSubtitlesNumbers: View{

    @State var tasks: [Task]
    @State var inProgressTasks: [Task]
    @State var completedTasks: [Task]
    
    var body: some View{
        
        HStack{
            HStack{
                Rectangle()
                    .frame(width: 15,height: 15)
                    .foregroundColor(.noite)
                    .cornerRadius(10)
                Text("\(tasks.count)")
                Divider().frame(height: 30)
            }
            
            HStack{
                Rectangle()
                    .frame(width: 15,height: 15)
                    .foregroundColor(.tarde)
                    .cornerRadius(10)
                Text("\(inProgressTasks.count)")
                Divider().frame(height: 30)
            }
            
            HStack{
                Rectangle()
                    .frame(width: 15,height: 15)
                    .foregroundColor(.manha)
                    .cornerRadius(10)
                Text("\(completedTasks.count)")
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

struct FlameCard: View{
    
    @State var text: String
    
    var body: some View{
        
        HStack{
            WebImage(url: URL(string: "https://images.emojiterra.com/google/noto-emoji/animated-emoji/1f525.gif"))
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 70, height: 50)
                                                        .padding(.leading)
            Text("**\(text)**").font(.system(.title3,design: .rounded))
        }
        .frame(width: 280,height: 120,alignment: .leading)
        .background(.tarde.opacity(0.9))
        .cornerRadius(20)
        .padding()
        .shadow(radius: 10)
        .foregroundColor(.black)
        
    }
    
}

struct Achievement: View{
    
    @State var tarefasFeitas: Int
    @State var conquista: Conquista
    
    var body: some View{
        
        if(tarefasFeitas>=conquista.valor ?? 0){
            HStack{
                Image(systemName: conquista.icon).foregroundColor(conquista.iconColor).shadow(radius: 10)
                Text("**\(conquista.mensagem)**").font(.system(.title3,design: .rounded))
            }.frame(width: 200,height: 70)
            .background(LinearGradient(colors: [Color .manha.opacity(0.6), Color .clear], startPoint: .bottom, endPoint: .top))
            .background(.noite)
            .cornerRadius(100)
            .padding()
            .shadow(radius: 10)
            .foregroundColor(.black)
        }
        else{
            HStack{
                Image(systemName: conquista.icon).foregroundColor(conquista.iconColor).shadow(radius: 10)
                Text("**\(conquista.mensagem)**").font(.system(.title3,design: .rounded))
            }.frame(width: 200,height: 70)
            .background(LinearGradient(colors: [Color .manha.opacity(0.6), Color .clear], startPoint: .bottom, endPoint: .top))
            .background(.noite)
            .cornerRadius(100)
            .padding()
            .shadow(radius: 10)
            .foregroundColor(.black)
            .colorMultiply(.gray)
        }
        

        
    }
    
}

//temporario para teste

struct Tarefa: Decodable, Hashable {
    let date: String?
    let tarefa: String?
    let bgColor: String?
    let selection: String?
}

struct Task: Hashable, Transferable, Codable {
    var name: String
    var priority: Priority
    var percentageCompleted: String
    var isCompleted: Bool = false
    var dueDate: String
    //var time: Time
    
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .content)
    }
}

enum Priority: String, Codable {
    case low = "Baixa"
    case medium = "Média"
    case high = "Alta"
}

enum Time: String, Codable {
    case low = "Baixa"
    case medium = "Média"
    case high = "Alta"
}

class configModel: ObservableObject {
    @Published var tasks: [Task] = []

    func fetch() {
        guard let url = URL(string: "http://192.168.128.116:1880/getDados") else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }

            do {
                let decoded = try JSONDecoder().decode([Task].self, from: data)
                DispatchQueue.main.async {
                    self.tasks = decoded
                }
            } catch {
                print("Erro ao decodificar JSON:", error)
            }
        }.resume()
    }
}
