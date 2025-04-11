//
//  ContentView.swift
//  Atividade 7
//
//  Created by Turma01-25 on 26/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        NavigationStack{
        
            ZStack {
                Color(.red).ignoresSafeArea()
                
                VStack {
                    
                    Spacer()
                    
                    ScrollView {
                        ForEach(viewModel.personagens?.sorted{$0.id < $1.id} ?? [Ehapo]){
                            personagem in
                            
                            NavigationLink(destination: DataView(nome: personagem.name ?? "")){
                                
                                HStack{
                                    
                                    if(personagem.image != ""){
                                        
                                        
                                        AsyncImage(url: URL(string: personagem.image!)) { phase in
                                            switch phase {
                                            case .empty:
                                                Image(systemName: "photo.artframe").resizable()
                                                    .frame(width: 100,height: 100,alignment: .leading).scaledToFit().cornerRadius(10)
                                            case .success(let image):
                                                image
                                                    .resizable()
                                                    .frame(width: 100,height: 100,alignment: .leading).scaledToFit().cornerRadius(10).padding(.bottom)
                                            case .failure:
                                                Image(systemName: "photo.artframe").resizable()
                                                    .frame(width: 100,height: 100,alignment: .leading).scaledToFit().cornerRadius(10)
                                            @unknown default:
                                                Image(systemName: "photo.artframe").resizable()
                                                    .frame(width: 100,height: 100,alignment: .leading).scaledToFit().cornerRadius(10)
                                            }
                                        }
                                        
                                        VStack{
                                            
                                            Text(personagem.name ?? "")
                                            Text("\(personagem.house ?? "") | \(personagem.patronus ?? "No patronus")").font(.caption)
                                        }
                                        
                                        Spacer()
                                        
                                    }
                                    
                                }.accentColor(.black)
                            }
                            
                            
                        }
                    }.padding().frame(maxWidth: .infinity,maxHeight: 500, alignment: .leading).background().cornerRadius(20)
                    
                    
                }
                .padding().onAppear(){
                    viewModel.fetch()
                }
                
            }
      }
        
        
        
    }
    
    
    
}

#Preview {
    ContentView()
}
