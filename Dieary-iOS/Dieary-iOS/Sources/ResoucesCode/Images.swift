import SwiftUI

import SwiftUI

public struct DiearyImage: View {
    public enum Image: String {
        case lockFire = "LockFire"
        case emptyFire = "EmptyFire"
        case ambiguous = "Ambiguous"
        case angry = "Angry"
        case excited = "Excited"
        case flutter = "Flutter"
        case happy = "Happy"
        case sad = "Sad"
        case stuffy = "Stuffy"
        case surprised = "Surprised"
        case tired = "Tired"
        case candle = "Candle"
        case raining = "Raining"
        case complete = "Complete"
        case pointOutFinger = "PointOutFinger"
    }

    private var image: Image
    private var renderingMode: SwiftUI.Image.TemplateRenderingMode

    public init(
        _ image: Image,
        renderingMode: SwiftUI.Image.TemplateRenderingMode = .original
    ) {
        self.image = image
        self.renderingMode = renderingMode
    }

    public var body: some View {
        switch image {
        case .lockFire, .emptyFire:
            dmsImageToImage()
                .renderingMode(renderingMode)
        default:
            dmsImageToImage()
                .resizable()
                .renderingMode(renderingMode)
        }
    }

    private func dmsImageToImage() -> SwiftUI.Image {
        SwiftUI.Image(image.rawValue)
    }
}
