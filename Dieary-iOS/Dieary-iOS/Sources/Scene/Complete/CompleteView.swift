import SwiftUI

struct CompleteView: View {
    @Environment(\.rootPresentationMode) var rootPresentationMode
    @StateObject var viewModel = CompleteViewModel()
    var body: some View {
        ZStack {
            switch viewModel.changeView {
            case .loading:
                VStack {
                    Spacer()
                    Text("맑기만 하면 사막이 된대요")
                        .diearyFont(.title(.title1), color: .white)

                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }

                DiearyImage(.raining)
                    .frame(width: 217, height: 217)
            case .complete:
                VStack(spacing: 16) {
                    DiearyImage(.complete)
                        .frame(width: 84, height: 84)

                    Text("일기 작성 완료!")
                        .diearyFont(.subText(.subText1), color: .white)
                }
            case .anotherDay:
                VStack(spacing: 50) {
                    Text("같은 기분을 느꼈던 날이에요")
                        .diearyFont(.title(.title1), color: .white)
                        .padding(.top, 70)

                    DiearyImage(.pointOutFinger)
                        .frame(width: 148, height: 148)

                    ScrollView {
                        ForEach(0..<3) { _ in
                            sameEmotionDayCell()
                        }
                    }
                }
                .dismissButton(isDismiss: $viewModel.isDismiss)
                .animation(.none, value: viewModel.isDismiss)
            }
        }
        .padding(.horizontal, 10)
        .onAppear(perform: viewModel.onAppear)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .diearyBackground()
        .navigationBarBackButtonHidden()
        .onChange(of: viewModel.isDismiss) { newValue in
            if newValue {
                rootPresentationMode.wrappedValue.dismiss()
            }
        }
    }

    @ViewBuilder
    func sameEmotionDayCell() -> some View {
        HStack {
            DiearyImage(.sad)
                .frame(width: 40, height: 40)

            Spacer()

            Text("내 인생은 왜이리 힘들까")
                .diearyFont(.subText(.subText1), color: .white)

            Spacer()

            Text("2월 16일")
                .diearyFont(.etc(.navigationText), color: .Text.text3)
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 32)
        .background(Color.listCell)
        .cornerRadius(10)
    }
}

struct CompleteView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CompleteView()
        }
    }
}
