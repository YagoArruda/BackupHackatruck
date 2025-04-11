//
//  Model.swift
//  Projeto
//
//  Created by Turma01-28 on 09/04/25.
//

import Foundation
import UniformTypeIdentifiers
import SwiftUI

struct DadosTarefa: Codable, Hashable {
    var date: String
    var bgColor: String
    var selection: String
    var tarefa: String
}

struct Task: Hashable, Transferable, Codable {
    var name: String
    var priority: Priority
    var percentageCompleted: String
    var isCompleted: Bool = false
    var dueDate: String
    //var time: Time
    
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .content)
    }
}

enum Priority: String, Codable {
    case low = "Baixa"
    case medium = "Média"
    case high = "Alta"
}

enum Time: String, Codable {
    case low = "Baixa"
    case medium = "Média"
    case high = "Alta"
}

struct Tarefa: Decodable, Hashable {
    let date: String?
    let tarefa: String?
    let bgColor: String?
    let selection: String?
}

class configModel: ObservableObject {
    @Published var tarefas: [Tarefa] = []

    func fetch() {
        guard let url = URL(string: "http://192.168.128.116:1880/getDados") else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }

            do {
                let decoded = try JSONDecoder().decode([Tarefa].self, from: data)
                DispatchQueue.main.async {
                    self.tarefas = decoded
                }
            } catch {
                print("Erro ao decodificar JSON:", error)
            }
        }.resume()
    }
}
