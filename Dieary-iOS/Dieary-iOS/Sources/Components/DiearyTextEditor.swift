import SwiftUI
import UIKit

public struct DiearyTextEditor: View {
    var placeholder: String
    @Binding var text: String
    var minHeight: CGFloat
    @FocusState var isFocused: Bool
    let onCommit: () -> Void

    public init(
        _ placeholder: String = "",
        text: Binding<String>,
        minHeight: CGFloat = 220,
        onCommit: @escaping () -> Void = {}
    ) {
        self.placeholder = placeholder
        _text = text
        self.minHeight = minHeight
        self.onCommit = onCommit

        UITextView.appearance().backgroundColor = .red
    }

    public var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $text)
                .diearyFont(.subText(.subText2), color: .clear)
                .padding(.horizontal, 16)
                .padding(.vertical, 15)
                .frame(minHeight: minHeight, alignment: .leading)
                .focused($isFocused)
                .scrollContentBackground(.hidden)
            
            Text(text.isEmpty ? placeholder : text)
                .diearyFont(.subText(.subText2), color: text.isEmpty ? .Gray.gray2 : .white)
                .padding(.horizontal, 21)
                .padding(.vertical, 21)
                .onTapGesture {
                    isFocused = true
                }
                .onSubmit {
                    onCommit()
                }
        }
        .frame(minHeight: minHeight)
    }
}

struct DiearyTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        DiearyTextEditor("asdf", text: .constant("asdfasdf"))
            .background(.yellow)
    }
}
