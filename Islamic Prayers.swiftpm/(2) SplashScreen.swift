import SwiftUI

struct SplashScreen: View {
    @EnvironmentObject var settings: Settings
            
    var body: some View {
        NavigationView {
            VStack {
                Text("**Islamic Prayers** helps Muslims observe the five daily prayers, which are based on the sun's position and vary by location.\n\nIt provides accurate Islamic Prayers, a Qibla compass for finding the Ka'bah, and a unique Traveling Mode for those journeying over 48 miles, allowing shortened prayers as permitted in Islam.\n\nDesigned to support both lifelong Muslims and converts, it simplifies staying connected to faith.")
                    .font(.title3)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .minimumScaleFactor(0.25)
                    .padding()
                
                Spacer()
                
                Image("Islamic Prayers")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .frame(maxWidth: 300)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        settings.firstLaunch = false
                    }
                }) {
                    Text("Done")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                        .background(settings.accentColor.color)
                        .foregroundColor(.primary)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 10)
            }
            .navigationTitle("Islamic Prayers")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}
