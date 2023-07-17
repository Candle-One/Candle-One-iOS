import SwiftUI

public extension View {
    func purpleGradient() -> some View {
        self
            .foregroundStyle(
                LinearGradient(
                    colors: [.Gradient.gradient1, .Gradient.gradient2],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
    }
}
