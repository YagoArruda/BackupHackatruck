//
//  ViewTesteConquistas2.swift
//  Projeto
//
//  Created by Turma01-25 on 04/04/25.
//

import SwiftUI

struct ViewTesteConquistas2: View {
    
    @State var dias: CGFloat = 5
    
    var body: some View {
        
        VStack{
            HStack{
                Image(systemName: "flame.fill")
                    .foregroundColor(.red)
                    .font(.system(size: dias * 10 + 10))
                Text("4 Dias Seguidos").font(.system(.title3,design: .rounded))
            }
        }
        
    }
}

#Preview {
    ViewTesteConquistas2()
}
