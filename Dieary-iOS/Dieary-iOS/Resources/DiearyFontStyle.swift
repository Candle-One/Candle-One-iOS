import SwiftUI

protocol DiearyFontable {
    var size: CGFloat { get }
    var weight: DiearyFontWeight { get }
}

public enum DiearyFontWeight: String {
    case bold = "Bold"
    case medium = "Medium"
    case light = "Light"
}

public enum DiearyFontStyle: Hashable {
    case title(DiearyFontStyle.Title)
    case subText(DiearyFontStyle.SubText)
    case caption(DiearyFontStyle.Caption)
    case etc(DiearyFontStyle.Etc)

    public enum Title: CGFloat, DiearyFontable {
        case title1 = 24
        case title2 = 20
    }

    public enum SubText: CGFloat, DiearyFontable {
        case subText1 = 16
        case subText2 = 13
    }

    public enum Caption: CGFloat, DiearyFontable {
        case caption1 = 16
        case caption2 = 12
    }

    public enum Etc: CGFloat, DiearyFontable {
        case largeText = 30
        case keyboardText = 40
        case navigationText = 12
    }
}

// MARK: - FontableSize
extension DiearyFontable where Self: RawRepresentable, Self.RawValue == CGFloat {
    var size: CGFloat {
        self.rawValue
    }
}

// MARK: - Title
public extension DiearyFontStyle.Title {
    var weight: DiearyFontWeight {
        switch self {
        case .title1, .title2:
            return .bold
        }
    }
}

// MARK: - SubText
public extension DiearyFontStyle.SubText {
    var weight: DiearyFontWeight {
        switch self {
        case .subText1:
            return .bold
        case .subText2:
            return .medium
        }
    }
}

// MARK: - Caption
public extension DiearyFontStyle.Caption {
    var weight: DiearyFontWeight {
        switch self {
        case .caption1, .caption2:
            return .medium
        }
    }
}

// MARK: - Etc
public extension DiearyFontStyle.Etc {
    var weight: DiearyFontWeight {
        switch self {
        case .largeText:
            return .bold
        case .navigationText:
            return .medium
        case .keyboardText:
            return .light
        }
    }
}
