import Foundation

public enum EmotionType {
    case ambiguous
    case angry
    case excited
    case flutter
    case happy
    case sad
    case stuffy
    case surprised
    case tired

    func fetchEmotionInfo() -> EmotionInfo {
        switch self {
        case .ambiguous:
            return .init(image: .ambiguous, explain: "애매해요")
        case .angry:
            return .init(image: .angry, explain: "화나요")
        case .excited:
            return .init(image: .excited, explain: "신나요")
        case .flutter:
            return .init(image: .flutter, explain: "설레요")
        case .happy:
            return .init(image: .happy, explain: "행복해요")
        case .sad:
            return .init(image: .sad, explain: "슬퍼요")
        case .stuffy:
            return .init(image: .stuffy, explain: "답답해요")
        case .surprised:
            return .init(image: .surprised, explain: "놀랐어요")
        case .tired:
            return .init(image: .tired, explain: "힘들어요")
        }
    }
}

public struct EmotionInfo {
    var image: DiearyImage.Image
    var explain: String

    init(image: DiearyImage.Image, explain: String) {
        self.image = image
        self.explain = explain
    }
}
