import SwiftUI

struct ContentView: View {
    @StateObject var manager = CityManager()
    @State var showCitiesByPop = false
    @State var showCitiesByLat = false
    
    
    var body: some View {
        VStack {
            Text("40 Largest Cities in Spain")
                .font(.title)
                .fontWeight(.heavy)
                .bold()
                .foregroundColor(Color("AccentColor"))
                .padding(.top)
            
            NavigationView {
                VStack{
                    VStack {
                        if showCitiesByPop == false && showCitiesByLat == false {
                            List(manager.allCities) { city in
                                NavigationLink (destination: CityCard(city: city)){
                                    HStack {
                                        Text("\(String(city.id)).")
                                        Text(city.city)
                                    }
                                }
                            }
                            .background((Color("BackgroundColor")))
                        } else if showCitiesByPop == true && showCitiesByLat == false {
                            List(manager.filteredCitiesByPopulation) { city in
                                NavigationLink (destination: CityCard(city: city)) {
                                    HStack {
                                        Text("\(String(city.id)).")
                                        Text(city.city)
                                    }
                                }
                            }
                        } else {
                            List(manager.filteredCitiesByLatitude) { city in
                                NavigationLink (destination: CityCard(city: city)) {
                                    HStack {
                                        Text("\(String(city.id)).")
                                        Text(city.city)
                                    }
                                }
                            }
                        }
                    }
                    .border(.black)
                    HStack {
                        Button {
                            manager.filteredCitiesByPopulation = manager.filter(newList: manager.allCities) { city in
                                return city.populationUrban < 200000
                            }
                            showCitiesByPop = true
                            showCitiesByLat = false
                        } label: {
                            PrimaryButton(text: "Population < 200,000")
                        }
                        
                        Button {
                            manager.filteredCitiesByLatitude = manager.filter(newList: manager.allCities) { city in
                                return city.latitude > 40.0
                            }
                            showCitiesByPop = false
                            showCitiesByLat = true
                        } label: {
                            PrimaryButton(text: "Latitude > 40")
                        }
                    }
                    .padding(.top)
                    
                    Button("Clear Filters") {
                        showCitiesByPop = false
                        showCitiesByLat = false
                    }
                    .padding(.top)
                }
            }
            
        }
        .background(Color("BackgroundColor"))
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
