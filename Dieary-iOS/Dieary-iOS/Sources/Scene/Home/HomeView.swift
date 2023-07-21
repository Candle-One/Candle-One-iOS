import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        VStack(spacing: 5) {
            Spacer()

            Text("오늘")
                .diearyFont(.subText(.subText1), color: .white)

            Text("7월 16일")
                .diearyFont(.etc(.largeText))
                .purpleGradient()
                .padding(.bottom, 72)

            candle()

            Text("촛불이 꺼지기")
                .diearyFont(.subText(.subText2), color: .Text.text3)

            Text("2시간 20분 전")
                .diearyFont(.title(.title1), color: .white)

            Spacer()
            Spacer()

            DiearyButton(text: "소중한 하루 기록하기") {
                viewModel.isNavigateEmotionSelection.toggle()
            }
            .padding(.bottom, 5)

            Text("오늘이 지나면 더 이상 쓸 수 없어요")
                .diearyFont(.etc(.navigationText), color: .white)
        }
        .padding(.horizontal, 17)
        .diearyBackground()
        .navigate(
            to: EmotionSelectionView()
                .environment(\.rootPresentationMode, $viewModel.isNavigateEmotionSelection),
            when: $viewModel.isNavigateEmotionSelection
        )
    }

    @ViewBuilder
    func candle() -> some View {
        ZStack(alignment: .top) {
            Circle()
                .foregroundColor(.light.opacity(0.6))
                .frame(width: 130, height: 130)
                .offset(y: -7)
                .blur(radius: 40)

            DiearyImage(.candle)
                .frame(width: 262, height: 262)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
