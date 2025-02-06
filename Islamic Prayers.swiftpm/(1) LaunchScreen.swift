import SwiftUI

struct LaunchScreen: View {
    @EnvironmentObject var settings: Settings

    @Binding var isLaunching: Bool

    @State private var size = 0.8
    @State private var opacity = 0.5
    @State private var gradientSize: CGFloat = 0.0

    @Environment(\.colorScheme) var systemColorScheme
    @Environment(\.customColorScheme) var customColorScheme

    var currentColorScheme: ColorScheme {
        if let colorScheme = settings.colorScheme {
            return colorScheme
        } else {
            return systemColorScheme
        }
    }

    var backgroundColor: Color {
        switch currentColorScheme {
        case .light:
            return Color.white
        case .dark:
            return Color.black
        @unknown default:
            return Color.white
        }
    }

    var gradient: LinearGradient {
        LinearGradient(
            colors: [settings.accentColor.color.opacity(0.3), settings.accentColor.color.opacity(0.5)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()

            gradient
                .clipShape(Circle())
                .scaleEffect(gradientSize)

            VStack {
                VStack {
                    Text("الأذان")
                        .font(.custom("Avenir", size: 30))
                        .foregroundColor(settings.accentColor.color)
                        .padding(.bottom, -1)

                    Image("Islamic Prayers")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .frame(width: 150, height: 150)
                        .padding()

                    Text("Islamic Prayers")
                        .font(.custom("Avenir", size: 30))
                        .foregroundColor(settings.accentColor.color)
                        .padding(.top, -1)
                }
                .foregroundColor(settings.accentColor.color)
                .scaleEffect(size)
                .opacity(opacity)
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.5)) {
                size = 0.9
                opacity = 1.0
                gradientSize = 3.0
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                withAnimation(.easeOut(duration: 0.5)) {
                    size = 0.8
                    gradientSize = 0.0
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                    withAnimation {
                        self.isLaunching = false
                    }
                }
            }
        }
    }
}
