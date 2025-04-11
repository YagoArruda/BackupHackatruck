//
//  ViewModel.swift
//  Atividade 7
//
//  Created by Turma01-25 on 26/03/25.
//

import Foundation

class ViewModel: ObservableObject{
    
    @Published var personagens: [Hapo]?
    
    func fetch(){
        
        guard let url = URL(string: "https://hp-api.onrender.com/api/characters/house/gryffindor")else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){
            
            [weak self] data, _,error in
            
            guard let data = data,error == nil else{
                return
            }
            
            do{
                
                let parsed = try JSONDecoder().decode([Hapo].self, from: data)
                
                DispatchQueue.main.async{
                    self?.personagens = parsed
                }
                
            }catch{
                print(error)
            }
            
            
        }
        task.resume()
        
        
    }
    
    
}
