//
//  ViewTeste2.swift
//  Projeto
//
//  Created by Turma01-25 on 02/04/25.
//

import SwiftUI
import Charts

struct ViewTeste2: View {
    
    var body: some View {
        
        
        
        NavigationStack {
            VStack{
                
                Spacer()
                
                Text("**Conquistas**").font(.system(.title, design: .rounded)).padding()
                
                HStack{
                    Image(systemName: "flame.fill").foregroundColor(.red)
                    Text("10 Dias Seguidos").font(.system(.title3,design: .rounded))
                }.frame(width: 250,height: 70)
                .background(.cor6F49A0)
                .cornerRadius(100)
                .padding()
                .shadow(radius: 10)
                .foregroundColor(.white)
                
                
                
                HStack{
                    Image(systemName: "trophy.fill").foregroundColor(.yellow)
                    Text("10 Tarefas").font(.system(.title3,design: .rounded))
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
        

}

#Preview {
    ViewTeste2()
}
