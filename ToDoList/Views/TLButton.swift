import SwiftUI

struct TLButtonView: View {
    let title: String
    let background: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButtonView(title: "value", background: .pink) {
        // Action
    }
}
