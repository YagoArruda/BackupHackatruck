//
//  ContentView.swift
//  Atividade 6
//
//  Created by Turma01-25 on 25/03/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    struct location: Hashable{
        let nome: String
        let foto: String
        let descricao: String
        let latitude: Double
        let longitude: Double
    }
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -14, longitude: -52), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
    
    var posicoes = [
        location(nome: "Golden Gate", foto: "https://media.cnn.com/api/v1/images/stellar/prod/181002113456-01-golden-gate-bridge-restricted.jpg?q=w_1160,c_fill/f_webp", descricao: "Uma grande presença na Califórnia desde sua inauguração após quatro anos de construção em 1937 a um custo de US$ 27 milhões, a ponte apareceu em filmes (The Maltese Falcon e Invasion of the Body Snatchers) e poesia (The Changing Light do poeta beat Lawrence Ferlinghetti) e contribuiu para o folclore local. E, no entanto, também é uma ponte funcional, com cerca de 200 funcionários trabalhando 24 horas por dia na manutenção da ponte para mais de 100.000 carros que a atravessam diariamente, bem como pedestres, ciclistas e pessoas que usam as balsas e ônibus da ponte.", latitude: -14, longitude: -52),
        location(nome: "Cristo Redentor", foto: "https://rederiohoteis.com/wp-content/uploads/2017/09/2017-10-29-cristo-redentor-conheca-a-historia-dessa-maravilha-do-mundo-moderno2.jpg.webp", descricao: "Quem nunca se encantou com uma imagem do Cristo Redentor, de braços abertos observando a Cidade Maravilhosa de cima do morro do Corcovado? Eleito uma das Sete Maravilhas do Mundo Moderno, em uma pesquisa aberta divulgada em julho de 2007, o Cristo Redentor é a maior estátua no estilo Art Déco do mundo, com 38 metros de altura e braços com área de 88 metros quadrados cada.", latitude: -15, longitude: -53)
    ]
    
    @State private var local = ""
    @State private var mostrarMais = false
    @State private var dados = 0
    
    func pinview(loc:location){
        
        position = MapCameraPosition.region(
            MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: loc.latitude, longitude: loc.longitude), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
    }
    
    
    var body: some View {
        NavigationStack{
            ZStack {
                VStack {
                    Map(position:$position){
                        ForEach(posicoes,id:\.self){ posicao in
                            Annotation(posicao.nome, coordinate: CLLocationCoordinate2D(latitude: posicao.latitude, longitude: posicao.longitude)){
                                Image(systemName: "pin.circle.fill").resizable().scaledToFit().frame(width: 40).foregroundColor(.black).onTapGesture {
                                    mostrarMais = true
                                    }.sheet(isPresented: $mostrarMais) {
                                        
                                        Spacer()
                                        
                                        AsyncImage(url: URL(string: posicao.foto)) { phase in
                                            switch phase {
                                            case .empty:
                                                Image(systemName: "pin.circle.fill").resizable()
                                                    .frame(width: 70,height: 70).scaledToFit()
                                            case .success(let image):
                                                image
                                                    .resizable()
                                                    .frame(width: 350,height: 200).scaledToFit()
                                            case .failure:
                                                Image(systemName: "pin.circle.fill").resizable()
                                                    .frame(width: 70,height: 70).scaledToFit()
                                            @unknown default:
                                                Image(systemName: "pin.circle.fill").resizable()
                                                    .frame(width: 70,height: 70).scaledToFit()
                                            }
                                        }
                                        
                                        VStack {
                                            Text(posicao.nome).font(.title).padding()
                                            Text(posicao.descricao)
                                        }.padding()
                                        
                                        Spacer()
                                        Spacer()
                                    }

                            }
                        }
                    }
                    
                }.ignoresSafeArea()
                
                VStack{

                    Picker(selection: $local, label: Text("Locais")) {
                        ForEach(posicoes,id:\.self){ pos in
                            Text(pos.nome).tag(pos.nome).font(.title)
                        }

                    }.padding([.leading, .trailing], 20).background(Color.select).accentColor(.white).cornerRadius(7).padding(.top).onChange(of: local){
                        valorAntigo, novoValor in
                        
                        pinview(loc: posicoes[posicoes.firstIndex(where: {$0.nome == local})!])
                        
                    }
                    
                    Spacer()
                }
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}
