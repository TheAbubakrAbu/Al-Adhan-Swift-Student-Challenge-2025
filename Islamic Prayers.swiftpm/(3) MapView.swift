import SwiftUI
import MapKit

struct IdentifiableMapItem: Identifiable {
    let id = UUID()
    let item: MKMapItem
}

struct MapView: View {
    @EnvironmentObject var settings: Settings
    @Binding var showingMap: Bool
    
    @State private var searchText = ""
    @State private var cityItems = [MKMapItem]()
    @State private var selectedCityItem: IdentifiableMapItem?
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 21.4225, longitude: 39.8262), // Kaaba
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )
    
    private func fetchCities(searchText: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            guard let response = response, error == nil else { return }
            DispatchQueue.main.async {
                self.cityItems = response.mapItems
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Home City: \(settings.homeLocation?.city ?? "None")")
                    .font(.headline)
                    .foregroundColor(settings.accentColor.color)
                    .lineLimit(1)
                
                TextField("Search for a city", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .onChange(of: searchText) { fetchCities(searchText: searchText) }
                
                if !searchText.isEmpty && !cityItems.isEmpty {
                    List(cityItems, id: \.placemark.name) { cityItem in
                        let city = cityItem.placemark.locality ?? cityItem.placemark.name ?? ""
                        let state = cityItem.placemark.administrativeArea ?? ""
                        let fullCityName = !state.isEmpty ? "\(city), \(state)" : city
                        
                        Button(action: {
                            selectedCityItem = IdentifiableMapItem(item: cityItem)
                            settings.homeLocation = Location(
                                city: fullCityName,
                                latitude: cityItem.placemark.coordinate.latitude,
                                longitude: cityItem.placemark.coordinate.longitude
                            )
                            updateRegion(to: settings.homeLocation!.coordinate)
                            searchText = ""
                        }) {
                            HStack {
                                Image(systemName: "mappin.circle.fill")
                                    .foregroundColor(settings.accentColor.color)
                                Text("\(fullCityName), \(cityItem.placemark.country ?? "")")
                                    .foregroundColor(settings.accentColor.color)
                            }
                        }
                    }
                    .frame(height: min(CGFloat(cityItems.count) * 50, 132))
                }
                
                Map(coordinateRegion: $region, annotationItems: [selectedCityItem].compactMap { $0 }) {
                    MapMarker(coordinate: $0.item.placemark.coordinate)
                }
                .edgesIgnoringSafeArea(.all)
                
                Button("Use Current Location") {
                    if let currentLoc = settings.currentLocation {
                        updateRegion(to: CLLocationCoordinate2D(latitude: currentLoc.latitude, longitude: currentLoc.longitude))
                        selectedCityItem = IdentifiableMapItem(item: MKMapItem(placemark: MKPlacemark(coordinate: currentLoc.coordinate)))
                        settings.homeLocation = Location(city: currentLoc.city, latitude: currentLoc.latitude, longitude: currentLoc.longitude)
                        settings.fetchPrayerTimes()
                    }
                }
                .padding()
                .background(settings.accentColor.color)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal, 16)
            }
            .navigationBarTitle("Select Location", displayMode: .inline)
            .navigationBarItems(trailing: Button("Done") { showingMap = false })
            .accentColor(settings.accentColor.color)
            .onAppear {
                if let homeLocation = settings.homeLocation {
                    updateRegion(to: homeLocation.coordinate)
                } else if let currentLoc = settings.currentLocation {
                    updateRegion(to: currentLoc.coordinate)
                }
            }
        }
    }
    
    private func updateRegion(to coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    }
}
