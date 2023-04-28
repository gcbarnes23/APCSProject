import SwiftUI

struct ContentView: View {
    @State var allCities: [City] = load("cityData.json")
   
    @State var filteredCitiesByPopulation = [City]()
    @State var filteredCitiesByLatitude = [City]()
    @State var showCitiesByPop = false
    @State var showCitiesByLat = false
    
    
    func filter (newList: [City], condition: (City) -> Bool) -> [City] {
        var filteredList = [City]()
        for city in allCities {
            if condition(city) {
                filteredList.append(city)
            } else {
                // Move on to next city
            }
        }
        return filteredList
    }
    
    var body: some View {
        VStack {
            Text("40 Largest Cities in Spain")
                .font(.title)
                .fontWeight(.heavy)
                .bold()
                .foregroundColor(Color("AccentColor"))
                .padding(.top)
            
            NavigationView {
                if showCitiesByPop == false && showCitiesByLat == false {
                    List(allCities) { city in
                        NavigationLink (destination: CityCard()){
                            HStack {
                                Text("\(String(city.id)).")
                                Text(city.city)
                            }
                        }
                    }
                } else if showCitiesByPop == true && showCitiesByLat == false {
                    List(filteredCitiesByPopulation) { city in
                        NavigationLink (destination: CityCard()) {
                            HStack {
                                Text("\(String(city.id)).")
                                Text(city.city)
                            }
                        }
                    }
                } else {
                    List(filteredCitiesByLatitude) { city in
                        NavigationLink (destination: CityCard()) {
                            HStack {
                                Text("\(String(city.id)).")
                                Text(city.city)
                            }
                        }
                    }
                }
            }
            
            HStack {
                Button {
                    self.filteredCitiesByPopulation = self.filter(newList: self.allCities) { city in
                        return city.populationUrban < 200000
                    }
                    showCitiesByPop = true
                    showCitiesByLat = false
                } label: {
                    PrimaryButton(text: "Population < 200,000")
                }
                
                Button {
                    self.filteredCitiesByLatitude = self.filter(newList: self.allCities) { city in
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
        .background(Color("BackgroundColor"))
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
