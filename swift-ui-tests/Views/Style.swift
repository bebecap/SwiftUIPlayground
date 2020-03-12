
import SwiftUI

extension ColorScheme {
    
    var textColor: Color {
        switch self {
        case .dark:
            return .white
        case .light:
            return .black
        }
    }
    
    var headerBackgroundColor: Color {
        switch self {
        case .dark:
            return .orange
        case .light:
            return .white
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .dark:
            return .black
        case .light:
            return .white
        }
    }
    
    var activityIndicatorColor: Color {
        switch self {
        case .dark:
            return .white
        case .light:
            return .black
        }
    }
}

struct Modifier {
    
    struct Label {
        struct Header: ViewModifier {
            @Environment(\.colorScheme) var colorScheme: ColorScheme
            
            func body(content: Content) -> some View {
                content.font(.system(size: 18, weight: .bold, design: .default))
                    .foregroundColor(colorScheme.textColor)
                    .background(colorScheme.headerBackgroundColor)
            }
        }

        struct Title: ViewModifier {
            @Environment(\.colorScheme) var colorScheme: ColorScheme
            
            func body(content: Content) -> some View {
                content.font(.system(size: 16, weight: .light, design: .default))
                    .foregroundColor(colorScheme.textColor)
            }
        }
    }
    
    struct Padding {
        struct Horizontal: ViewModifier {
            func body(content: Content) -> some View {
                content.padding([.leading, .trailing], 16)
            }
        }
        
        struct Vertical: ViewModifier {
            func body(content: Content) -> some View {
                content.padding([.top, .bottom], 16)
            }
        }
        
        struct All: ViewModifier {
            func body(content: Content) -> some View {
                content.modifier(Vertical()).modifier(Horizontal())
            }
        }
    }

    struct Background: ViewModifier {
        @Environment(\.colorScheme) var colorScheme: ColorScheme
        
        func body(content: Content) -> some View {
            content.background(colorScheme.backgroundColor)
        }
    }
}

// Amazingly strange converter taken from

extension Color {
    var uiColor: UIColor {
        let components = self.components()
        return UIColor(red: components.r, green: components.g, blue: components.b, alpha: components.a)
    }

    private func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {

        let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0

        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000ff) / 255
        }
        return (r, g, b, a)
    }
}
