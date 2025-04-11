//
//  p3View.swift
//  Atividade 3
//
//  Created by Turma01-25 on 21/03/25.
//

import SwiftUI

struct p3View: View {
    
    @State public var corFundo = Color.white

    var body: some View {
        
        ZStack {
            Color(corFundo).edgesIgnoringSafeArea(.top)
            
            VStack {
                Image(systemName: "personalhotspot.circle.fill").resizable().scaledToFit().colorInvert()
            }.padding().onAppear(){corFundo = definirCor()}
        }
        
    }
}

#Preview {
    p3View()
}
