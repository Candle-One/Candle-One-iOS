import Foundation
import SwiftUI

final class CompleteViewModel: ObservableObject {
    enum CompleteType {
        case loading
        case complete
        case anotherDay

        mutating func nextEnum() {
            switch self {
            case .loading:
                self = .complete
            case .complete:
                self = .anotherDay
            case .anotherDay:
                break
            }
        }
    }
    @Published var changeView = CompleteType.loading
    @Published var isDismiss = false

    func onAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation { self.changeView.nextEnum() }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation { self.changeView.nextEnum() }
            }
        }
    }
}
