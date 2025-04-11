//
//  MusicaView.swift
//  Atividade 5
//
//  Created by Turma01-25 on 24/03/25.
//

import SwiftUI

struct MusicaView: View
{
    @State var musica_selecionada: Song
    
    var body: some View {
        ZStack (alignment: .top){
            Color .black.edgesIgnoringSafeArea(.all)
            
            LinearGradient (gradient: Gradient(colors: [ musica_selecionada.cor_fundo.opacity( 0.8 ), Color .clear]), startPoint: .top, endPoint: .bottom)
                        .frame(height: 600 )
                        .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                AsyncImage(url: URL(string:musica_selecionada.capa)) { phase in
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
                
                Text("**\(musica_selecionada.name)**")
                Text("**\(musica_selecionada.artist)**")
                
                Spacer()
                
                HStack{
                    Image(systemName: "shuffle").font(.system(size: 30))
                    Spacer()
                    Image(systemName: "backward.end.fill").font(.system(size: 35))
                    Spacer()
                    Image(systemName: "play.fill").font(.system(size: 50))
                    Spacer()
                    Image(systemName: "forward.end.fill").font(.system(size: 35))
                    Spacer()
                    Image(systemName: "repeat").font(.system(size: 30))
                }
                
                Spacer()
                Spacer()
                
            }.foregroundColor(.white).padding()
            
        }
    }
}


let musicaTeste =
Song(id:1,name: "Template Musica",artist: "View teste",capa: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/album-cover-music%2Cspotify%2Csoundcloud-%281%29-design-template-2a808c4bd38bd62df705416c5511a88f_screen.jpg?ts=1659917376",cor_fundo: Color.mint)

#Preview {
    MusicaView(musica_selecionada: musicaTeste)
}
