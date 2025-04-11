//
//  ContentView.swift
//  Atividade 8
//
//  Created by Turma01-25 on 27/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var dados = ViewModel()
    
    var body: some View {
        
        
        ZStack {
            Color .black.edgesIgnoringSafeArea(.all)
            
            LinearGradient (gradient: Gradient(colors: [ Color .blue.opacity( 0.8 ), Color .clear]), startPoint: .top, endPoint: .bottom)
                .frame(height: 900 )
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                ForEach(dados.submarinos ?? [defaultSub]){
                    submarino in
                    
                    HStack {
                        AsyncImage(url: URL(string: submarino.imagem ?? "")) { phase in
                            switch phase {
                            case .empty:
                                Image(systemName: "photo.artframe")
                            case .success(let image):
                                image
                                    .resizable()
                                    .frame(width: 100,height: 100,alignment: .leading).scaledToFit().cornerRadius(10).padding(.bottom)
                            case .failure:
                                Image(systemName: "photo.artframe")
                            @unknown default:
                                Image(systemName: "photo.artframe")
                            }
                        }
                        VStack {
                            Text(submarino.nome ?? "")
                            Text("\(submarino.classe ?? "") | \(submarino.fabricante ?? "")").font(.caption)
                        }
                    }.frame(maxWidth: .infinity,alignment: .leading).padding()
                    
                    
                   
                    
                }
                
            }.foregroundColor(.white)
            
            
            
            
            
        }.frame(maxWidth: .infinity,alignment: .leading).onAppear(){
            dados.fetch()
        }
        
        
        
    }
}

#Preview {
    ContentView()
}
