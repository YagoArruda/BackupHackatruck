import Foundation
import SwiftUI
import Charts
import SDWebImageSwiftUI

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
    
    @Binding var tasks: [DadosTarefa]
    @Binding var inProgressTasks: [DadosTarefa]
    @Binding var completedTasks: [DadosTarefa]
    
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
                    .init(tipo: "Fazer", porcentagem: 4, cor: Color.afazer),
                    .init(tipo: "Fazendo", porcentagem: 2, cor: Color.fazendo),
                    .init(tipo: "Feito", porcentagem: 1, cor: Color.feito)
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
                    .foregroundColor(.afazer)
                    .cornerRadius(10)
                Text("A Fazer")
            }
            
            HStack{
                Rectangle()
                    .frame(width: 15,height: 15)
                    .foregroundColor(.fazendo)
                    .cornerRadius(10)
                Text("Fazendo")
            }
            
            HStack{
                Rectangle()
                    .frame(width: 15,height: 15)
                    .foregroundColor(.feito)
                    .cornerRadius(10)
                Text("Finalizadas")
            }
        }
        
    }
    
}

struct Title: View{
    
    @State var message: String
    
    var body: some View{
        
        HStack{
            Text("**\(message)**")
                .font(.title)
        }
        .padding(10)
        
    }
    
}

struct Card: View{
    
    @State var text: String
    
    var body: some View{
        
        HStack{
            WebImage(url: URL(string: "https://images.emojiterra.com/google/noto-emoji/animated-emoji/1f525.gif"))
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 60, height: 60)
            Text("**\(text)**").font(.system(.title3,design: .rounded))
        }
        .frame(width: UIScreen.main.bounds.width)
        .padding(60)
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
            }.frame(width: UIScreen.main.bounds.width - 20,height: 70)
            .background(LinearGradient(colors: [Color.afazer.opacity(0.6), Color .clear], startPoint: .bottom, endPoint: .top))
            .background(.lilas)
            .cornerRadius(100)
            .padding()
            .shadow(radius: 10)
            .foregroundColor(.black)
        }
        else{
            HStack{
                Image(systemName: conquista.icon).foregroundColor(conquista.iconColor).shadow(radius: 10)
                Text("**\(conquista.mensagem)**").font(.system(.title3,design: .rounded))
            }.frame(width: UIScreen.main.bounds.width - 20,height: 70)
            .background(LinearGradient(colors: [Color .purple.opacity(0.6), Color .clear], startPoint: .bottom, endPoint: .top))
            .background(.lilasEscuro)
            .cornerRadius(100)
            .padding()
            .shadow(radius: 10)
            .foregroundColor(.black)
            .colorMultiply(.gray)
        }
        

        
    }
    
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
    .init(icon: "trophy.fill", iconColor: .yellow, mensagem: "10000º Tarefa", valor: 10000)
]
