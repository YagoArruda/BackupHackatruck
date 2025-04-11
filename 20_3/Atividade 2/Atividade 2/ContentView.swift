//
//  ContentView.swift
//  Atividade 2
//
//  Created by Turma01-25 on 20/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var corFundo = Color.cinza
    @State private var velocidade = 0.0
    @State private var tempo = 1.0
    @State private var resultado = 0.0
    @State private var imagem = "CasoGenerico"
    @State private var texto_velocidade = "0,0"
 
    
    var body: some View {
        ZStack {
            Color(corFundo).ignoresSafeArea()
            
            VStack{
                Text("Digite a velocidade (Km):")
                
                TextField("0", value: $velocidade,format: .number).multilineTextAlignment(.center).keyboardType(.decimalPad).background().cornerRadius(15)
                
                Text("Digite o tempo (h):")
                
                TextField("0", value: $tempo,format: .number).multilineTextAlignment(.center).keyboardType(.decimalPad).background().cornerRadius(15)
                
                Button("Calcular") {
                    
                    if tempo <= 0{
                        tempo = 1
                    }
                    
                    resultado = velocidade/tempo
                    
                    var temp1 = 0
                    var temp2 = 0.0
                    var temp3 = ""
                    var temp4 = 0
                    
                    temp1 = Int(resultado)
                    temp2 = resultado - Double(temp1)
                    temp2 = temp2 * 100
                    temp4 = Int(temp2)
                    temp3 = "\(temp1),\(temp4)"
                    
                    texto_velocidade = temp3
                    
                    
                    switch resultado{
                    case 0:
                        corFundo = Color.cinza
                        imagem = "CasoGenerico"
                        break
                    case 0...9.9 :
                        corFundo = Color.verdeClaro
                        imagem = "Tartaruga"
                        break
                    case 10...29.9:
                        corFundo = Color.azulClaro
                        imagem = "Elefante"
                        break
                    case 30...69.9:
                        corFundo = Color.laranjaClaro
                        imagem = "Avestruz"
                        break
                    case 70...79.9:
                        corFundo = Color.amareloClaro
                        imagem = "Leao"
                        break
                    case 80...130 :
                        corFundo = Color.vermelhoClaro
                        imagem = "Guepardo"
                        break
                    default:
                        corFundo = Color.ukn
                        imagem = "Ukn"
                        break
                        
                    }
                    
                }.padding().font(.title).foregroundColor(.orange).background(.black).cornerRadius(15).padding(.top,20)
                
                Spacer()
                
                Text("\(texto_velocidade) km/h").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                Image(imagem).resizable().frame(width: 300, height: 200).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).scaledToFit()
                
                Spacer()
                
                HStack{
                    VStack{
                        Text("TARTARUGA")
                        Text("ELEFANTE")
                        Text("AVESTRUZ")
                        Text("LEÃO")
                        Text("GUEPARDO")
                    }
                    
                    VStack{
                        Text("(0 - 9,9km/h)")
                        Text("(10 - 29,9km/h)")
                        Text("(30 - 69,9km/h)")
                        Text("(70 - 79,9km/h)")
                        Text("(80 - 130km/h)")
                    }
                    
                    VStack{
                        Circle().frame(width:15,height:15)
                            .foregroundColor(.verdeClaro)
                        Circle().frame(width:15,height:15)
                            .foregroundColor(.azulClaro)
                        Circle().frame(width:15,height:15)
                            .foregroundColor(.laranjaClaro)
                        Circle().frame(width:15,height:15)
                            .foregroundColor(.amareloClaro)
                        Circle().frame(width:15,height:15)
                            .foregroundColor(.vermelhoClaro)
                    }
                }.padding().background(.black).foregroundColor(.white).cornerRadius(15)
                
                
            }.padding()
            
            

            
        }
        
    }
}

#Preview {
    ContentView()
}
