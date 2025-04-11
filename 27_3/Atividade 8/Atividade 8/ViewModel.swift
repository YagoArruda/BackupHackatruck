//
//  ViewModel.swift
//  Atividade 8
//
//  Created by Turma01-25 on 27/03/25.
//

import Foundation

class ViewModel: ObservableObject{
    
@Published var submarinos: [Sub]?

func fetch(){
    
    guard let url = URL(string: "http://127.0.0.1:1880/nitget")else{
        return
    }
    
    let task = URLSession.shared.dataTask(with: url){
        
        [weak self] data, _,error in
        
        guard let data = data,error == nil else{
            return
        }
        
        do{
            
            let parsed = try JSONDecoder().decode([Sub].self, from: data)
            
            DispatchQueue.main.async{
                self?.submarinos = parsed
            }
            
        }catch{
            print(error)
        }
        
        
    }
    task.resume()
    
    
}


}
