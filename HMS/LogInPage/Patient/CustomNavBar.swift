import SwiftUI

struct CustomNavigationBar: View {
    var title: String
    
    var body: some View {
        HStack {
            Button(action: {
                // Action to pop to previous view
                // You can implement this according to your navigation setup
            }) {
                Image(systemName: "chevron.left")
            }
            Spacer()
            Text(title)
                .font(.headline)
            Spacer()
        }
        .padding()
    }
}
