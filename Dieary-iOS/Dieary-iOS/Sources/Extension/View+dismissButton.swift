import SwiftUI

struct DismissButtonModifier: ViewModifier {
    @Binding var isDismiss: Bool
    let willDismiss: () -> Void

    public init(
        willDismiss: @escaping () -> Void,
        isDismiss: Binding<Bool>
    ) {
        self.willDismiss = willDismiss
        _isDismiss = isDismiss
    }

    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        willDismiss()
                        isDismiss.toggle()
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
    }
}
public extension View {
    func dismissButton(
        willDismiss: @escaping () -> Void = {},
        isDismiss: Binding<Bool>
    ) -> some View {
        modifier(DismissButtonModifier(willDismiss: willDismiss, isDismiss: isDismiss))
    }
}
