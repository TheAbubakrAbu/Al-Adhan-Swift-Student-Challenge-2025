import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settings: Settings
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("PRAYER TIMES")) {
                        NavigationLink(destination: SettingsPrayerView()) {
                            Label("Prayer Settings", systemImage: "safari")
                        }
                    }
                    
                    Section(header: Text("APPEARANCE")) {
                        SettingsAppearanceView()
                    }
                    
                    Section(header: Text("CREDITS")) {
                        Text("Made by Abubakr Elmallah, a 17-year-old high school student when this app was developed.\n\nSpecial thanks to my parents and to Mr. Joe Silvey, my English teacher and Muslim Student Association Advisor.")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        
                        Link("Credit for the prayer times calculations goes to Batoul Apps", destination: URL(string: "https://github.com/batoulapps/adhan-swift")!)
                            .foregroundColor(settings.accentColor.color)
                    }
                }
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Done")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(settings.accentColor.color)
                        .foregroundColor(.primary)
                        .cornerRadius(10)
                        .padding(.horizontal, 16)
                }
            }
            .navigationTitle("Settings")
        }
        .navigationViewStyle(.stack)
    }
}

struct SettingsPrayerView: View {
    @EnvironmentObject var settings: Settings
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var showingMap: Bool = false
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("PRAYER CALCULATION")) {
                    VStack(alignment: .leading) {
                        Picker("Calculation", selection: $settings.prayerCalculation.animation(.easeInOut)) {
                            ForEach(calculationOptions, id: \.1) { option in
                                Text(option.0).tag(option.1)
                            }
                        }
                        
                        Text("The different calculation methods calculate Fajr and Isha differently.")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .padding(.vertical, 2)
                    }
                    
                    VStack(alignment: .leading) {
                        Toggle("Use Hanafi Calculation for Asr", isOn: $settings.hanafiMadhab.animation(.easeInOut))
                            .font(.subheadline)
                            .tint(settings.accentColor.color)
                        
                        Text("The Hanafi madhab uses later calculations for Asr.")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .padding(.vertical, 2)
                    }
                }
                
                Section(header: Text("TRAVELING MODE")) {
                    Button(action: {                        
                        showingMap = true
                    }) {
                        HStack {
                            Text("Set Home City")
                                .font(.subheadline)
                                .foregroundColor(settings.accentColor.color)
                            if !(settings.homeLocation?.city.isEmpty ?? true) {
                                Spacer()
                                Text(settings.homeLocation?.city ?? "")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .sheet(isPresented: $showingMap) {
                        MapView(showingMap: $showingMap)
                            .environmentObject(settings)
                    }
                    
                    Toggle("Traveling Mode Turns on Automatically", isOn: $settings.travelAutomatic.animation(.easeInOut))
                        .font(.subheadline)
                        .tint(settings.accentColor.color)
                    
                    VStack(alignment: .leading) {
                        Toggle("Traveling Mode", isOn: $settings.travelingMode.animation(.easeInOut))
                            .font(.subheadline)
                            .tint(settings.accentColor.color)
                            .disabled(settings.travelAutomatic)
                        
                        Text("If you are traveling more than 48 mi (77.25 km), then it is obligatory to pray Qasr, where you combine Dhuhr and Asr (2 rakahs each) and Maghrib and Isha (3 and 2 rakahs). Allah said in the Quran, “And when you (Muslims) travel in the land, there is no sin on you if you shorten As-Salah (the prayer)” [Al-Quran, An-Nisa, 4:101]. \(settings.travelAutomatic ? "This feature turns on and off automatically, but you can also control it manually in settings." : "You can control traveling mode manually in settings.")")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .padding(.vertical, 2)
                    }
                }
                
                PrayerOffsetsView()
            }
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Done")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(settings.accentColor.color)
                    .foregroundColor(.primary)
                    .cornerRadius(10)
                    .padding(.horizontal, 16)
            }
        }
        .navigationTitle("Prayer Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingsAppearanceView: View {
    @EnvironmentObject var settings: Settings
    
    var body: some View {        
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
            ForEach(accentColors, id: \.self) { accentColor in
                Circle()
                    .fill(accentColor.color)
                    .frame(width: 30, height: 30)
                    .onTapGesture {
                        withAnimation {
                            settings.accentColor = accentColor
                        }
                    }
            }
        }
        .padding(.vertical)
    }
}

struct PrayerOffsetsView: View {
    @EnvironmentObject var settings: Settings
    
    var body: some View {
        Section(header: Text("PRAYER OFFSETS")) {
            Stepper("Fajr: \(settings.offsetFajr) min", value: $settings.offsetFajr, in: -10...10)
            Stepper("Sunrise: \(settings.offsetSunrise) min", value: $settings.offsetSunrise, in: -10...10)
            Stepper("Dhuhr: \(settings.offsetDhuhr) min", value: $settings.offsetDhuhr, in: -10...10)
            Stepper("Asr: \(settings.offsetAsr) min", value: $settings.offsetAsr, in: -10...10)
            Stepper("Maghrib: \(settings.offsetMaghrib) min", value: $settings.offsetMaghrib, in: -10...10)
            Stepper("Isha: \(settings.offsetIsha) min", value: $settings.offsetIsha, in: -10...10)
            
            Text("Use these offsets to adjust prayer times earlier or later. Negative values move the time earlier, positive values move it later.")
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

let calculationOptions: [(String, String)] = [
    ("Muslim World League", "Muslim World League"),
    ("Moonsight Committee", "Moonsight Committee"),
    ("Umm Al-Qura", "Umm Al-Qura"),
    ("Egypt", "Egypt"),
    ("Dubai", "Dubai"),
    ("Kuwait", "Kuwait"),
    ("Qatar", "Qatar"),
    ("Turkey", "Turkey"),
    ("Tehran", "Tehran"),
    ("Karachi", "Karachi"),
    ("Singapore", "Singapore"),
    ("North America", "North America")
]
