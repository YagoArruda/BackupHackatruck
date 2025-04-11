//
//  ViewTesteConquistas.swift
//  Projeto
//
//  Created by Turma01-25 on 04/04/25.
//

import SwiftUI

struct ViewTesteConquistas: View {
    var body: some View {
        
        VStack{
            
            Spacer()
            
            Text("**Conquistas**").font(.system(.title, design: .rounded)).padding()
            
            VStack{
                HStack{
                    Image(systemName: "clipboard.fill").foregroundColor(.white)
                    Text("Criou 7 Tarefas").font(.system(.title3,design: .rounded))
                }
                
                HStack{
                    Text("**Criou 7 novas tarefas**").font(.system(.caption,design: .rounded))
                }
                .padding(.horizontal)
            }.frame(width: 250,height: 60)
            .background(.cor6F49A0)
            .cornerRadius(20)
            .padding()
            .shadow(radius: 10)
            .foregroundColor(.white)
            
            
            VStack{
                HStack{
                    Image(systemName: "clipboard.fill").foregroundColor(.white)
                    Text("Criou 7 Tarefas").font(.system(.title3,design: .rounded))
                }
                
                HStack{
                    Text("**Criou 7 novas tarefas**").font(.system(.caption,design: .rounded))
                }
                .padding(.horizontal)
            }.frame(width: 250,height: 60)
            .background(.cor6F49A0)
            .cornerRadius(20)
            .padding()
            .shadow(radius: 10)
            .foregroundColor(.white)
            .colorMultiply(.gray)
            
            //--------------
            Divider()
            
            VStack{
                HStack{
                    Image(systemName: "flame.fill").foregroundColor(.red)
                    Text("4 Dias Seguidos").font(.system(.title3,design: .rounded))
                }
                Divider().background(.white)
                HStack{
                    Text("**01/04/2025**").font(.system(.caption,design: .rounded))
                    Spacer()
                    Text("**---**").font(.system(.caption,design: .rounded))
                    Spacer()
                    Text("**04/04/2025**").font(.system(.caption,design: .rounded))
                }
                .padding(.horizontal)
            }.frame(width: 250,height: 60)
            .background(.cor6F49A0)
            .cornerRadius(20)
            .padding()
            .shadow(radius: 10)
            .foregroundColor(.white)
            
            
            
            VStack{
                HStack{
                    Image(systemName: "flame.fill").foregroundColor(.red)
                    Text("4 Dias Seguidos").font(.system(.title3,design: .rounded))
                }
                Divider().background(.white)
                HStack{
                    Text("**01/04/2025**").font(.system(.caption,design: .rounded))
                    Spacer()
                    Text("**---**").font(.system(.caption,design: .rounded))
                    Spacer()
                    Text("**04/04/2025**").font(.system(.caption,design: .rounded))
                }
                .padding(.horizontal)
            }.frame(width: 250,height: 60)
            .background(.cor6F49A0)
            .cornerRadius(20)
            .padding()
            .shadow(radius: 10)
            .foregroundColor(.white)
            .colorMultiply(.gray)
            
            
            //--------------
            Divider()
            
            HStack{
                Image(systemName: "trophy.fill").foregroundColor(.yellow)
                Text("100 Tarefas").font(.system(.title3,design: .rounded))
            }.frame(width: 200,height: 70)
            .background(.cor6F49A0)
            .cornerRadius(100)
            .padding()
            .shadow(radius: 10)
            .foregroundColor(.white)
            
            
            HStack{
                Image(systemName: "trophy.fill").foregroundColor(.yellow)
                Text("100 Tarefas").font(.system(.title3,design: .rounded))
            }.frame(width: 200,height: 70)
            .background(.cor6F49A0)
            .cornerRadius(100)
            .padding()
            .shadow(radius: 10)
            .foregroundColor(.white)
            .colorMultiply(.gray)
            
            
            Spacer()
            Spacer()
            Spacer()
            
            
        }
        
    }
}

#Preview {
    ViewTesteConquistas()
}
