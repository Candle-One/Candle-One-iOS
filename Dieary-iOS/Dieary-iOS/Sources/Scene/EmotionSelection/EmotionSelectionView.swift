import SwiftUI

struct EmotionSelectionView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.rootPresentationMode) var rootPresentationMode
    @StateObject var viewModel = EmotionSelectionViewModel()
    var body: some View {
        VStack(spacing: 5) {
            Text("내 기분은 지금")
                .diearyFont(.title(.title1), color: .white)
                .padding(30)

            HStack {
                VStack {
                    emotionSelectionCell(emotionType: .flutter)
                    emotionSelectionCell(emotionType: .happy)
                    emotionSelectionCell(emotionType: .sad)
                }
                VStack {
                    emotionSelectionCell(emotionType: .ambiguous)
                    emotionSelectionCell(emotionType: .angry)
                    emotionSelectionCell(emotionType: .stuffy)
                }
                VStack {
                    emotionSelectionCell(emotionType: .excited)
                    emotionSelectionCell(emotionType: .tired)
                    emotionSelectionCell(emotionType: .surprised)
                }
            }
            
            Spacer()

            DiearyButton(text: "일기 쓰기") {
                viewModel.isNavigateWrite.toggle()
            }
            .disabled(viewModel.selectedEmotion == nil)
            .animation(.easeIn(duration: 0.1), value: viewModel.selectedEmotion)
            .padding(.bottom, 5)

            Text("기분이 애매하다면 ‘애매해요’를 눌러보세요")
                .diearyFont(.etc(.navigationText), color: .white)
        }
        .padding(17)
        .diearyBackground()
        .backButton(dismiss: dismiss)
        .navigate(
            to: WriteView(selectedEmotion: $viewModel.selectedEmotion)
                .environment(\.rootPresentationMode, rootPresentationMode),
            when: $viewModel.isNavigateWrite
        )
    }

    @ViewBuilder
    func emotionSelectionCell(emotionType: EmotionType) -> some View {
        VStack(spacing: 3) {
            DiearyImage(emotionType.fetchEmotionInfo().image)
                .frame(width: 70, height: 70)
                .padding(5)
                .overlay {
                    if viewModel.selectedEmotion == emotionType {
                        ZStack(alignment: .topTrailing) {
                            Circle().stroke()
                                .foregroundColor(.Purple.purple2)
                            
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .foregroundColor(.Purple.purple2)
                                .background(.white)
                                .clipShape(Circle())
                                .frame(width: 15, height: 15)
                                .padding(3)
                        }
                    }
                }
                .onTapGesture {
                    if viewModel.selectedEmotion == emotionType {
                        viewModel.selectedEmotion = nil
                    } else {
                        viewModel.selectedEmotion = emotionType
                    }
                }
                .animation(.easeIn(duration: 0.2), value: viewModel.selectedEmotion)

            Text(emotionType.fetchEmotionInfo().explain)
                .diearyFont(.subText(.subText2), color: .white)
        }
        .padding(15)
    }
}

struct EmotionSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionSelectionView()
    }
}
