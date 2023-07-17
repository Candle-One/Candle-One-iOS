import SwiftUI

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background {
                Color.background
                    .ignoresSafeArea()
            }
    }
}

public extension View {
    func diearyBackground() -> some View {
        modifier(BackgroundModifier())
    }
}
