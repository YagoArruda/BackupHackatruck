//
//  ContentView.swift
//  Atividade 3
//
//  Created by Turma01-25 on 21/03/25.
//

import SwiftUI

public func definirCor() -> Color{
    let cores = [Color.red,Color.green,Color.blue,Color.yellow,Color.black,Color.orange,Color.indigo,Color.teal,Color.purple,Color.pink,Color.mint,Color.gray,Color.cyan,Color.brown]
    
    return cores[Int.random(in: 1..<cores.count)]
}


struct ContentView: View {
    
    var body: some View {
        
        ZStack {

            TabView {
                    
                    p1View().tabItem {
                        Text("Aba 1")
                        Image(systemName: "paperplane.circle.fill")
                    }
                    p2View().tabItem {
                        Text("Aba 2")
                        Image(systemName: "apple.terminal.circle.fill")
                    }
                    p3View().tabItem {
                        Text("Aba 3")
                        Image(systemName: "personalhotspot.circle.fill")
                    }
                
                    List {
                        Text("Aba 1").listItemTint(/*@START_MENU_TOKEN@*/.monochrome/*@END_MENU_TOKEN@*/)
                        Text("Aba 2").listItemTint(.monochrome)
                        Text("Aba 3").listItemTint(/*@START_MENU_TOKEN@*/.monochrome/*@END_MENU_TOKEN@*/)
                    }.tabItem {
                        Text("Lista")
                        Image(systemName: "list.bullet")
                    }

            }

        }
       
    }
    
}

#Preview {
    ContentView()
}
