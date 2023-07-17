import SwiftUI

struct WriteView: View {
    private enum FocusField {
        case title
        case content
    }
    @FocusState private var focusField: FocusField?
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = WriteViewModel()
    @Binding var selectedEmotion: EmotionType?
    var body: some View {
        VStack(spacing: 10) {
            if let selectedEmotion {
                DiearyImage(selectedEmotion.fetchEmotionInfo().image)
                    .frame(width: 70, height: 70)

                Text("무엇이 당신을 슬프게 했나요?")
                    .diearyFont(.subText(.subText2), color: .Sub.sub2)
                    .padding(.bottom, 40)
            }

            VStack(spacing: 0) {
                DiearyTextField("일기 제목", text: $viewModel.title) {
                    focusField = .content
                }
                .focused($focusField, equals: .title)
                .padding(.horizontal, 20)
                .padding(.bottom, 12)

                Divider()
                    .background(Color.Sub.sub2)
                    .padding(.horizontal, 20)

                DiearyTextEditor("여기를 눌러 내용을 작성하세요", text: $viewModel.content) {
                    focusField = nil
                }
                .focused($focusField, equals: .content)
            }
        }
        .navigationBarItems(trailing: completeButton())
        .diearyBackground()
        .BackButton(dismiss: dismiss)
        .navigate(to: CompleteView(), when: $viewModel.isCompleteDidTapped)
    }

    @ViewBuilder
    func completeButton() -> some View {
        Button {
            viewModel.isCompleteDidTapped.toggle()
        } label: {
            Text("완료")
                .diearyFont(.subText(.subText1), color: viewModel.buttonDisable() ? .Text.text2 : .white)
        }
    }
}

struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView(selectedEmotion: .constant(.angry))
    }
}
