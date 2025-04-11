//
//  ContentView.swift
//  Atividade 5
//
//  Created by Turma01-25 on 24/03/25.
//

import SwiftUI

struct Song : Identifiable{
    var id: Int
    var name: String
    var artist: String
    var capa: String
    var cor_fundo: Color
}

struct ContentView: View {
    

    
    @State var musica_selecionada = 0
    
    var arrayMusicas = [
        Song(id:1,name: "Not Like Us",artist: "Kendrick Lamar",capa: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/spotify-style-illustration-album-art-2020-2-design-template-a62b54e646ff4680a0af18d6e86da896_screen.jpg?ts=1600257820",cor_fundo: Color.yellow),
        Song(id:2,name: "Good Luck, Babe!",artist: "Chappell Roan",capa: "https://mir-s3-cdn-cf.behance.net/project_modules/hd/00f56557183915.59cbcc586d5b8.jpg",cor_fundo: Color.orange),
        Song(id:3,name: "Espresso",artist: "Sabrina Carpenter",capa: "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/b2010557183915.59cbcc586db2b.jpg",cor_fundo: Color.purple),
        Song(id:4,name: "Birds of a Feather",artist: "Billie Eilish",capa: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUDlDZ7dKPf-R0bDdUVvPxumW1jislvmPuEhGKnvtGt6PL7CeyCLBZ8wmfu4ymrStbgLQ&usqp=CAU",cor_fundo: Color.blue),
        Song(id:5,name: "A Bar Song (Tipsy)",artist: "Shaboozey",capa: "https://marketplace.canva.com/EAE9A9X7JkU/1/0/1600w/canva-playlist---disco-uOx_yU3BSU0.jpg",cor_fundo: Color.white),
        Song(id:6,name: "Girl So Confusing",artist: "Charli XCX With Lorde",capa: "https://portal.estrategia.com/wp-content/uploads/2023/07/recysTrTdu769ISSp-Tudosobremsicadahistriaaosgnerosmaispopulares.jpg.webp",cor_fundo: Color.brown),
        Song(id:7,name: "Bodyguard",artist: "Beyoncé",capa: "https://www.staccatoescolademusica.com.br/img/blog-img/upload-blog/540752-5-2-2021-16-31-36-1m.jpg",cor_fundo: Color.pink),
        Song(id:8,name: "Diet Pepsi",artist: "Addison Rae",capa: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/album-cover-music%2Cspotify%2Csoundcloud-%281%29-design-template-2a808c4bd38bd62df705416c5511a88f_screen.jpg?ts=1659917376",cor_fundo: Color.mint)
        
    ]
    
    
    
    var body: some View {
        NavigationStack{
            ZStack (alignment: .top){
                Color .black.edgesIgnoringSafeArea(.all)
                
                LinearGradient (gradient: Gradient(colors: [ Color .blue.opacity( 0.8 ), Color .clear]), startPoint: .top, endPoint: .bottom)
                    .frame(height: 600 )
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                    Image("capa").resizable().frame(width: 250, height: 250).scaledToFit()
                    
                    Text("**HackaFM**").font(.title).frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack{
                        Image("capa").resizable()
                            .frame(width: 45,height: 45).scaledToFit()
                        Text("**HackaSong**")
                        
                    }.frame(maxWidth: .infinity, alignment: .leading).padding(.bottom)
                    
                    
                    ScrollView {
                        ForEach(arrayMusicas) { musica in
                            NavigationLink(destination: MusicaView(musica_selecionada: musica)){
                                HStack{
                                    AsyncImage(url: URL(string: musica.capa)) { phase in
                                        switch phase {
                                        case .empty:
                                            Image("capa").resizable()
                                                .frame(width: 70,height: 70).scaledToFit()
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .frame(width: 70,height: 70).scaledToFit()
                                        case .failure:
                                            Image("capa").resizable()
                                                .frame(width: 70,height: 70).scaledToFit()
                                        @unknown default:
                                            Image("capa").resizable()
                                                .frame(width: 70,height: 70).scaledToFit()
                                        }
                                    }
                                    
                                    VStack{
                                        Text(musica.name).font(.system(size: 15))
                                        Text(musica.artist).font(.system(size: 15))
                                    }
                                    
                                    Image(systemName: "ellipsis").frame(maxWidth: .infinity, alignment: .trailing).font(.title)
                                }
                            }
                            
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        
                        Text("**Sugeridos**").font(.title).frame(maxWidth: .infinity, alignment: .leading)
                        
                        ScrollView(.horizontal) {
                            HStack (spacing: 20){
                                
                                ForEach(arrayMusicas.reversed()) { musica in
                                    NavigationLink(destination: MusicaView(musica_selecionada: musica)){
                                        
                                        VStack{
                                            AsyncImage(url: URL(string: musica.capa)) { phase in
                                                switch phase {
                                                case .empty:
                                                    Image("capa").resizable()
                                                        .frame(width: 200,height: 200).scaledToFit()
                                                case .success(let image):
                                                    image
                                                        .resizable()
                                                        .frame(width: 200,height: 200).scaledToFit()
                                                case .failure:
                                                    Image("capa").resizable()
                                                        .frame(width: 200,height: 200).scaledToFit()
                                                @unknown default:
                                                    Image("capa").resizable()
                                                        .frame(width: 200,height: 200).scaledToFit()
                                                }
                                            }
                                            
                                            Text(musica.name).font(.title2)
                                        }
                                    }
                                }.frame(maxWidth: .infinity, alignment: .leading)
                                
                            }
                            
                            
                        }
                    }
                    
                    
                }.foregroundColor(.white).padding()
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}
