import Foundation

final class EmotionSelectionViewModel: ObservableObject {
    @Published var selectedEmotion: EmotionType?
    @Published var isNavigateWrite = false
}
