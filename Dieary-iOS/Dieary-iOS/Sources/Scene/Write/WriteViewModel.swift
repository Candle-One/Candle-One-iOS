import Foundation

final class WriteViewModel: ObservableObject {
    @Published var selectedEmotion: EmotionType?
    @Published var title: String = ""
    @Published var content: String = ""
    @Published var isCompleteDidTapped: Bool = false

    func buttonDisable() -> Bool {
        title.isEmpty || content.isEmpty
    }
}
