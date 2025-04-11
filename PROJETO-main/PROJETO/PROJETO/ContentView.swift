//
//  ContentView.swift
//  PROJETO
//
//  Created by Turma01-19 on 03/04/25.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var selectedIndex = 0
    @State var presented = false
    
    
    let icons = [
        "house",
        "medal",
        "plus",
        "cube.box",
        "gear"
        ]
    var body: some View {
        VStack{
            ZStack{
                Spacer()
                  //  .fullScreenCover(isPresented: $presented, content: {
//                    Button(action: {
//                        presented.toggle()
//                    }, label: {
//                        //NavigationLink(destination: CRIAR())
//                        CRIAR()
                Button("Show Sheet") {
                    presented.toggle()
                       }.sheet(isPresented: $presented){
                    CRIAR()
                }
              //  })
                switch selectedIndex {
                case 0:
                    NavigationStack {
                        VStack{
                            HOME()
                        }
                    }
                case 1:
                    NavigationStack {
                        VStack{
                            //
                        }
                    }
                case 3:
                    NavigationStack {
                        VStack{
                            TAREFAS()
                        }
                    }
                case 4:
                    NavigationStack {
                        VStack{
                            Text("configuracoes")
                        }
                    }
                default:
                    NavigationStack {
                        VStack{
                            Text("error")
                        }
                    }
                }
                
                
            }
           
            
            //Divider()
            HStack{
                ForEach(0..<5, id: \.self){
                    number in
                    Spacer()
                    Button(action: {
                        if number == 2 {
                            presented.toggle()
                        } else {
                            self.selectedIndex = number
                        }
                    }, label: {
                        if number == 2 {
                            Image(systemName: icons[number])
                                .font(.system(size: 25, weight: .regular, design: .default))
                                .foregroundColor(.white)
                                .frame(width: 60, height: 60)
                                .background(Color.purple)
                                .cornerRadius(50)
                                .offset(x: 0, y: -10)
                        } else {
                            Image(systemName: icons[number])
                                .font(.system(size: 25, weight: .regular, design: .default))
                                .foregroundColor(selectedIndex == number ? .purple : Color(UIColor.lightGray))
                        }
                    })
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
