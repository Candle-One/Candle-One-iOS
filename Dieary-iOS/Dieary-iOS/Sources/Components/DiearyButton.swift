import SwiftUI

public struct DiearyButton: View {
    var text: String
    var style: DiearyButtonStyle.Style
    var color: Color
    var action: () -> Void

    public init(
        text: String,
        style: DiearyButtonStyle.Style = .mainPurple,
        color: Color = .Purple.purple2,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.style = style
        self.color = color
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(text)
        }
        .buttonStyle(DiearyButtonStyle(style: style, color: color))
    }
}

struct DiearyButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            DiearyButton(text: "Contained") { }
            DiearyButton(text: "Outlined", style: .mainPurple) { }
        }
    }
}
