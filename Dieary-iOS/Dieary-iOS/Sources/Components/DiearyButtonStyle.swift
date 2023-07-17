import SwiftUI

public struct DiearyButtonStyle: ButtonStyle {
    public enum Style {
        case mainPurple
    }

    var style: Style
    var color: Color

    public func makeBody(configuration: Configuration) -> some View {
        switch style {
        case .mainPurple:
            return AnyView(MainPurpleButton(configuration: configuration, color: color))
        }
    }
}

// MARK: - Usage
extension Button {
    func diearyStyle(_ style: DiearyButtonStyle.Style, color: Color) -> some View {
        self.buttonStyle(DiearyButtonStyle(style: style, color: color))
    }
}

// MARK: - Contained
extension DiearyButtonStyle {
    struct MainPurpleButton: View {
        let configuration: ButtonStyle.Configuration
        let color: Color
        @Environment(\.isEnabled) private var isEnabled: Bool

        var body: some View {
            configuration.label
                .padding(.vertical, 17)
                .frame(maxWidth: .infinity)
                .diearyFont(.subText(.subText1), color: .white)
                .background(color)
                .cornerRadius(20)
                .opacity(
                    isEnabled ?
                        configuration.isPressed ? 0.7 : 1.0 :
                        0.5
                )
        }
    }
}
