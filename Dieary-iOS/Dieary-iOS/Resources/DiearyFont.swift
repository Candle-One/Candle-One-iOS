import SwiftUI

public struct DiearyFont: ViewModifier {
    public var style: DiearyFontStyle

    public func body(content: Content) -> some View {
        switch style {
        case let .title(font):
            return content
                .font(.custom("Pretendard-\(font.weight.rawValue)", size: font.size))

        case let .subText(font):
            return content
                .font(.custom("Pretendard-\(font.weight.rawValue)", size: font.size))

        case let .caption(font):
            return content
                .font(.custom("Pretendard-\(font.weight.rawValue)", size: font.size))

        case let .etc(font):
            return content
                .font(.custom("Pretendard-\(font.weight.rawValue)", size: font.size))
        }
    }
}

public extension View {
    func diearyFont(_ style: DiearyFontStyle) -> some View {
        self
            .modifier(DiearyFont(style: style))
    }

    func diearyFont(_ style: DiearyFontStyle, color: Color) -> some View {
        self
            .diearyFont(style)
            .foregroundColor(color)
    }
}
