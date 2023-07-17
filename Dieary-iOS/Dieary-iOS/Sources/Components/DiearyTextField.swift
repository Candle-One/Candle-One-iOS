import SwiftUI

public struct DiearyTextField: View {
    var placeholder: String
    @Binding var text: String
    var onCommit: () -> Void
    @FocusState var isFocused: Bool

    public init(
        _ placeholder: String = "",
        text: Binding<String>,
        onCommit: @escaping () -> Void = {}
    ) {
        self.placeholder = placeholder
        _text = text
        self.onCommit = onCommit
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            Text(placeholder)
                .opacity(text.isEmpty ? 1 : 0)
                .diearyFont(.title(.title2), color: .Gray.gray2)

            TextField("", text: $text)
                .diearyFont(.title(.title2), color: .white)
                .focused($isFocused)
                .onSubmit(onCommit)
        }
        .animation(.easeIn(duration: 0.3), value: isFocused)
    }
}

struct DiearyTextField_Previews: PreviewProvider {
    static var previews: some View {
        DiearyTextField("Test", text: .constant(""))
    }
}
