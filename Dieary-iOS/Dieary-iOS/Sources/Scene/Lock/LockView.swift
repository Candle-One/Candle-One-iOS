import SwiftUI

struct LockView: View {
    @StateObject var viewModel = LockViewModel()
    var body: some View {
        VStack(spacing: 40) {
            Spacer()
            Text("암호 입력")
                .diearyFont(.title(.title1), color: .white)
            HStack {
                Group {
                    ForEach(0..<viewModel.password.count, id: \.self) { _ in
                        DiearyImage(.lockFire)
                    }
                    ForEach(viewModel.password.count..<4, id: \.self) { _ in
                        DiearyImage(.emptyFire)
                    }
                }
                .frame(width: 60, height: 88)
            }
            Spacer()
            HStack(alignment: .top) {
                VStack {
                    keyboardCell(1)
                    keyboardCell(3)
                    keyboardCell(7)
                }
                Spacer()
                VStack {
                    keyboardCell(2)
                    keyboardCell(4)
                    keyboardCell(8)
                    keyboardCell(0)
                }
                Spacer()
                VStack {
                    keyboardCell(3)
                    keyboardCell(6)
                    keyboardCell(9)
                    Button { viewModel.deleteTapped() } label: {
                        Image(systemName: "delete.backward")
                            .font(.custom("Pretendard-Medium", size: 30))
                            .foregroundColor(.white)
                            .frame(width: 90, height: 90)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        .diearyBackground()
    }

    @ViewBuilder
    func keyboardCell(_ num: Int) -> some View {
        Button { viewModel.keypadTapped(num) } label: {
            Text(String(num))
                .diearyFont(.etc(.keyboardText), color: .white)
                .frame(width: 90, height: 90)
        }
    }
}

struct LockView_Previews: PreviewProvider {
    static var previews: some View {
        LockView()
    }
}
