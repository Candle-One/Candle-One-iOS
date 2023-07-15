import SwiftUI

public extension Color {
    static let background: Color = Color("Background")
    static let light: Color = Color("Light")
    struct Purple { }
    struct Gray { }
    struct Sub { }
    struct Text { }
}

public extension Color.Purple {
    static let purple1: Color = Color("Purple 1")
    static let purple2: Color = Color("Purple 2")
    static let purple3: Color = Color("Purple 3")
}

public extension Color.Gray {
    static let gray1: Color = Color("Gray 1")
    static let gray2: Color = Color("Gray 2")
}

public extension Color.Sub {
    static let sub1: Color = Color("Sub 1")
    static let sub2: Color = Color("Sub 2")
    static let sub3: Color = Color("Sub 3")
}

public extension Color.Text {
    static let text1: Color = Color("Text 1")
    static let text2: Color = Color("Text 2")
    static let text3: Color = Color("Text 3")
}
