import SwiftUI

struct CompletedView: View {
    @State var name: String
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text("Complete")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                    .background(
                        Capsule()
                            .fill(.green.opacity(0.8))
                    )
                Spacer()
            }
            Text(name)
                .foregroundStyle(.white)
                .font(.headline)
                .fontWeight(.bold)
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
    CompletedView(name: "Apps Revamp")
}
