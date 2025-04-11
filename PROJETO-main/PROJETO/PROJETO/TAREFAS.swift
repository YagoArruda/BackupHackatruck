import SwiftUI

struct TAREFAS: View {
    
    @StateObject var vm = ViewModel()
    @State private var progresso = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    
                    ForEach (vm.tasks, id: \.self) { k
                        in
                        if(true){
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .frame(width: 300, height: 170)
                                .foregroundStyle(Color(k.bgColor))
                                .padding()
                                .overlay {
                                    VStack {
                                        Text("\(k.tarefa)")
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        Text(k.date)
                                        Text(k.selection)
                                    }
                                    
                                    VStack{
                                        Spacer()
                                        ProgressView("", value: progresso, total: 100)
                                            .onReceive(timer) { _ in
                                                if progresso < 100 {
                                                    progresso += 2
                                                }
                                                
                                                
                                            }
                                    }
                                }
                        } else {
                            ProgressView()
                        }
                        
                        
                        
                    }
                    Spacer()
                }
            }
            .onAppear(){
                vm.fetch()
            }
        }
    }
}
#Preview {
    TAREFAS()
}
