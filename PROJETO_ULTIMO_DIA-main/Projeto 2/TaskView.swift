import SwiftUI

struct TaskView: View {
    
    @State var name: String
    @State var priority: String
    @State var dueDate: String
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text("\(priority)")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                    .background(
                        Capsule()
                            .fill(priority == "Alta" ? Color.red.opacity(0.8) :
                                  priority == "Média" ? Color.yellow.opacity(0.8) :
                                  Color.cyan)

                    )
                Spacer()
            }
            Text(name)
                .foregroundStyle(.white)
                .font(.headline)
                .fontWeight(.bold)
            Text("Due Date: " + dueDate)
                .foregroundStyle(.white)
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.top, 10)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(red: 35/255, green: 35/255, blue: 37/255))
                .shadow(radius: 2)
        )
    }
}

#Preview {
    TaskView(name: "Apps Revamp", priority: "Média", dueDate: "16-11-24")
}
