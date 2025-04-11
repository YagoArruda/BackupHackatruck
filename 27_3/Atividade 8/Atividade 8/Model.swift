//
//  Model.swift
//  Atividade 8
//
//  Created by Turma01-25 on 27/03/25.
//

import Foundation

struct Sub: Decodable,Identifiable{
    let id: Int
    let nome: String?
    let cor: String?
    let tamanho: Int?
    let fabricante: String?
    let ano: String?
    let classe: String?
    let imagem: String?
}

let defaultSub = Sub(id: 0,nome: "",cor: "",tamanho: 0,fabricante: "",ano: "",classe: "",imagem: "")
