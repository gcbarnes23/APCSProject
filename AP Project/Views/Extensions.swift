import Foundation
import SwiftUI

extension Text {
    func bodyText() -> some View {
        self
            .font(.title3)
            .foregroundColor(Color("AccentColor"))
            .padding(.bottom)
    }
}
