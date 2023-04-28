import SwiftUI

struct PrimaryButton: View {
    var text: String
    var background: Color = Color("AccentColor")
    var body: some View {
        Text(text)
            .frame(width: 100)
            .foregroundColor(.white)
            .padding(7)
            .background(background)
            .cornerRadius(30)
            .multilineTextAlignment(.center)
            .shadow(radius: 10)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Clear Filters")
    }
}
