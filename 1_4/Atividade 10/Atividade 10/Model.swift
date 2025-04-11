//
//  Model.swift
//  Atividade 10
//
//  Created by Turma01-25 on 01/04/25.
//

import Foundation

struct Umi: Decodable,Identifiable{
    let id: Date
    let umidade: Double?
}

let default_ = Umi(id: Date.now,umidade: 0.0)
