import SwiftUI

struct PrayerView: View {
    @EnvironmentObject var settings: Settings
    
    @Environment(\.scenePhase) private var scenePhase
    
    @State private var showAlert = false
    
    @State private var showingArabicSheet = false
    @State private var showingAdhkarSheet = false
    @State private var showingDuaSheet = false
    @State private var showingTasbihSheet = false
    @State private var showingDateSheet = false
    @State private var showingSettingsSheet = false
    
    func prayerTimeRefresh(force: Bool) {
        settings.requestNotificationAuthorization()
        settings.fetchPrayerTimes(force: force)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if let currentLoc = settings.currentLocation, currentLoc.latitude != 1000, currentLoc.longitude != 1000 {
                
            } else if settings.showLocationAlert || settings.currentLocation == nil {
                withAnimation {
                    settings.currentLocation = Location(city: "Cupertino, CA", latitude: 37.3230, longitude: -122.0322)
                    settings.fetchPrayerTimes(force: true)
                    showAlert = true
                }
            }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("DATE AND LOCATION")) {
                    if let hijriDate = settings.hijriDate {
                        HStack {
                            Text(hijriDate.english)
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                            
                            Text(hijriDate.arabic)
                        }
                        .font(.footnote)
                        .foregroundColor(settings.accentColor.color)
                    }
                    
                    VStack {
                        HStack {
                            if let currentLoc = settings.currentLocation {
                                let currentCity = currentLoc.city
                                
                                Image(systemName: "location.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 18, height: 18)
                                    .foregroundColor(settings.accentColor.color)
                                    .padding(.trailing, 8)
                                
                                Text(currentCity)
                                    .font(.subheadline)
                                    .lineLimit(nil)
                            } else {
                                Image(systemName: "location.slash")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 18, height: 18)
                                    .foregroundColor(settings.accentColor.color)
                                    .padding(.trailing, 8)
                                
                                Text("No location")
                                    .font(.subheadline)
                                    .lineLimit(nil)
                            }
                            
                            Spacer()
                            
                            QiblaView()
                                .padding(.horizontal)
                        }
                        .foregroundColor(.primary)
                        .font(.subheadline)
                    }
                }
                
                if settings.prayers != nil && settings.currentLocation != nil {
                    PrayerCountdown()
                        .transition(.opacity)
                    PrayerList()
                        .transition(.opacity)
                }
            }
            .refreshable {
                prayerTimeRefresh(force: true)
            }
            .onAppear {
                prayerTimeRefresh(force: false)
            }
            .onChange(of: scenePhase) { _, newScenePhase in
                prayerTimeRefresh(force: false)
            }
            .navigationTitle("Islamic Prayers")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Menu {
                        Button(action: {
                            showingArabicSheet = true
                        }) {
                            Image(systemName: "textformat.size.ar")
                            Text("Arabic Alphabet")
                        }
                        
                        Button(action: {
                            showingAdhkarSheet = true
                        }) {
                            Image(systemName: "book.closed")
                            Text("Common Adhkar")
                        }
                        
                        Button(action: {
                            showingDuaSheet = true
                        }) {
                            Image(systemName: "text.book.closed")
                            Text("Common Duas")
                        }
                        
                        Button(action: {
                            showingTasbihSheet = true
                        }) {
                            Image(systemName: "circles.hexagonpath.fill")
                            Text("Tasbih Counter")
                        }
                        
                        Button(action: {
                            showingDateSheet = true
                        }) {
                            Image(systemName: "calendar")
                            Text("Hijri Calendar Converter")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                    .padding(.leading, 6)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {                        
                        showingSettingsSheet = true
                    } label: {
                        Image(systemName: "gear")
                    }
                    .padding(.trailing, 6)
                }
            }
            .sheet(isPresented: $showingArabicSheet) {
                NavigationView {
                    ArabicView()
                        .accentColor(settings.accentColor.color)
                }
            }
            .sheet(isPresented: $showingAdhkarSheet) {
                NavigationView {
                    AdhkarView()
                        .accentColor(settings.accentColor.color)
                }
            }
            .sheet(isPresented: $showingDuaSheet) {
                NavigationView {
                    DuaView()
                        .accentColor(settings.accentColor.color)
                }
            }
            .sheet(isPresented: $showingTasbihSheet) {
                NavigationView {
                    TasbihView()
                        .accentColor(settings.accentColor.color)
                }
            }
            .sheet(isPresented: $showingDateSheet) {
                NavigationView {
                    DateView()
                        .accentColor(settings.accentColor.color)
                }
            }
            .sheet(isPresented: $showingSettingsSheet) {
                SettingsView()
                    .accentColor(settings.accentColor.color)
                    .preferredColorScheme(settings.colorScheme)
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
        .onChange(of: settings.selectedDate) { _, value in
            settings.datePrayers = settings.getPrayerTimes(for: value) ?? []
            settings.dateFullPrayers = settings.getPrayerTimes(for: value, fullPrayers: true) ?? []
            
            let calendar = Calendar.current
            
            if !calendar.isDate(value, inSameDayAs: Date()) {
                settings.changedDate = true
            }
        }
        .alert("Location Permission Denied", isPresented: $showAlert) {
            Button("OK", role: .cancel) {
                print("User acknowledged the location alert.")
            }
        } message: {
            Text("Islamic Prayers could not access your location. The default location has been set to Cupertino. You can update your location by enabling permissions in the app settings.")
        }
        .navigationViewStyle(.stack)
    }
}
