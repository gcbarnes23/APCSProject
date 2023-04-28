import Foundation
import SwiftUI

extension Text {
    func bodyText() -> some View {
        self
            .foregroundColor(Color("AccentColor"))
            .padding()
    }
}
