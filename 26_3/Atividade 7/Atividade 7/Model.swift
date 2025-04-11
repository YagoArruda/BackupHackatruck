//
//  Model.swift
//  Atividade 7
//
//  Created by Turma01-25 on 26/03/25.
//

import Foundation

struct Hapo: Decodable,Identifiable{
    let id: String
    let name: String?
    let alternate_names: [String]?
    let species: String?
    let gender: String?
    let house: String?
    let dateOfBirth: String?
    let yearOfBirth: Int?
    let wizard: Bool?
    let ancestry: String?
    let eyeColour: String?
    let hairColour: String?
    let wand: Wand
    let patronus: String?
    let hogwartsStudent: Bool?
    let hogwartsStaff: Bool?
    let actor: String?
    let alternate_actors: [String]?
    let alive: Bool?
    let image: String?
}



struct Wand: Decodable{
    let wood: String?
    let core: String?
    let length: Double?
}


let Ewand = Wand(wood: "", core: "", length: 0.0)

let Ehapo = Hapo(id: "", name: "", alternate_names: [], species: "", gender: "", house: "", dateOfBirth: "", yearOfBirth: 0, wizard: false, ancestry: "", eyeColour: "", hairColour: "", wand: Ewand, patronus: "", hogwartsStudent: false, hogwartsStaff: false, actor: "", alternate_actors: [], alive: false, image: "")
