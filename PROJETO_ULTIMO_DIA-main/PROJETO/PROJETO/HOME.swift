import SwiftUI

struct HOME: View {
    var body: some View {
        ScrollView(.horizontal){
            
            ZStack{
                Color.white
                HStack{
                    // primeiro quadrado
                    ZStack{
                        ExtractedView()
                            
                        
                        VStack{
                            //imagem do topo
                
                            Text("A fazer")
                                .padding(.top)
                                .foregroundColor(.purple)
                                .font(.largeTitle)
                
                            Spacer()
                
                            //tarefas
                            /*RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .frame(width: 250, height: 120)
                                .foregroundStyle(.lightyellow)
                            
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .frame(width: 250, height: 120)
                                .foregroundStyle(.lightyellow)
                            
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .frame(width: 250, height: 120)
                                .foregroundStyle(.lightyellow)
                             */
                        }
                    }
                    //segundo quadrado
                    
                    ZStack{
                        
                        Color.tarde
                            .ignoresSafeArea()
                            .frame(width: UIScreen.main.bounds.width - 0)
                        VStack{
                            //imagem
                            
                        
                            Text("Fazendo")
                            .padding(.top)
                            .foregroundColor(.purple)
                            .font(.largeTitle)
        
                            
                            Spacer()
                            /*
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .frame(width: 250, height: 120)
                                .foregroundStyle(.mediumblue)
                            
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .frame(width: 250, height: 120)
                                .foregroundStyle(.mediumblue)
                            
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .frame(width: 250, height: 120)
                                .foregroundStyle(.mediumblue)
                             */
                        }
                    }
                    //terceiro quadrado
                    
                    ZStack{
                        Color.noite
                            .ignoresSafeArea()
                            .frame(width: UIScreen.main.bounds.width - 0)

                        
                        VStack{
                            //imagem topo
                                
                            Text("Feito")
                            .padding(.top)
                            .foregroundColor(.purple)
                            .font(.largeTitle)
                                Spacer()
                                
                            
                            /*
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .frame(width: 250, height: 120)
                                .foregroundStyle(.babyblue)
                            
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .frame(width: 250, height: 120)
                                .foregroundStyle(.babyblue)
                            
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .frame(width: 250, height: 120)
                                .foregroundStyle(.babyblue)
                             
                             */
                        }
                    }
                    
                }
                
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
   
            }
    
        }


        .scrollIndicators(.hidden)
        .ignoresSafeArea()
        .scrollTargetBehavior(.paging)

    }
    
}
#Preview {
    HOME()
}

struct ExtractedView: View {
    var body: some View {
        Color.manha
            .ignoresSafeArea()
            .frame(width: UIScreen.main.bounds.width - 0)
        
            .scrollTargetLayout()
    }
}
