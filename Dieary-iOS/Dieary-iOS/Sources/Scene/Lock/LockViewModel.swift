import Foundation
import SwiftUI

final class LockViewModel: ObservableObject {
    @Published var password: [Int] = []
    @Published var isNavigateHome = false
    @Published var inputDisabled = false
    
    func keypadTapped(_ num: Int) {
        password.append(num)
        if password.count >= 4 {
            inputDisabled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation {
                    self.navigateHomeView()
                }
            }
        }
    }

    func deleteTapped() {
        let _ = password.popLast()
    }

    private func navigateHomeView() {
        if password.map({ String($0) }).joined() == "0000" {
            self.isNavigateHome.toggle()
        } else {
            self.password = []
            self.inputDisabled = false
        }
    }
}
