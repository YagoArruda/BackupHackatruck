//
//  ViewModel.swift
//  Atividade 10
//
//  Created by Turma01-25 on 01/04/25.
//

import Foundation

class ViewModel: ObservableObject{
    
@Published var umidades: [Umi]?

func fetch(){
    
    guard let url = URL(string: "http://192.168.128.91:1880/tsget")else{
        return
    }
    
    let task = URLSession.shared.dataTask(with: url){
        
        [weak self] data, _,error in
        
        guard let data = data,error == nil else{
            return
        }
        
        do{
            
            let parsed = try JSONDecoder().decode([Umi].self, from: data)
            
            DispatchQueue.main.async{
                self?.umidades = parsed
            }
            
        }catch{
            print(error)
        }
        
        
    }
    task.resume()
    
    
}

}
