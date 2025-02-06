import SwiftUI

@main
struct IslamicPrayersApp: App {
    @StateObject private var settings = Settings()
    
    @State private var isLaunching = true
    
    var body: some Scene {
        WindowGroup {
            Group {
                if isLaunching {
                    LaunchScreen(isLaunching: $isLaunching)
                } else {
                    Group {
                        if settings.firstLaunch {
                            SplashScreen()
                        } else {
                            PrayerView()
                        }
                    }
                    .onAppear {
                        withAnimation {
                            settings.requestNotificationAuthorization()
                            settings.fetchPrayerTimes()
                        }
                    }
                }
            }
            .environmentObject(settings)
            .accentColor(settings.accentColor.color)
            .transition(.opacity)
        }
        .onChange(of: settings.prayerCalculation) {
            settings.fetchPrayerTimes(force: true)
        }
        .onChange(of: settings.hanafiMadhab) {
            settings.fetchPrayerTimes(force: true)
        }
        .onChange(of: settings.travelingMode) {
            settings.fetchPrayerTimes(force: true)
        }
        .onChange(of: settings.hijriOffset) {
            settings.updateDates()
        }
    }
}

struct DismissKeyboardOnScrollModifier: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .scrollDismissesKeyboard(.immediately)
        } else {
            content
        }
    }
}

extension View {
    func dismissKeyboardOnScroll() -> some View {
        self.modifier(DismissKeyboardOnScrollModifier())
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        TextField("Search", text: $text)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}
