
import Foundation

struct DadosTarefa: Codable, Hashable {
    var date: String
    var bgColor: String
    var selection: String
    var tarefa: String
}


struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}
