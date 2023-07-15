import Foundation

final class LockViewModel: ObservableObject {
    @Published var password: [Int] = []
    
    func keypadTapped(_ num: Int) {
        password.append(num)
    }

    func deleteTapped() {
        let _ = password.popLast()
    }
}
