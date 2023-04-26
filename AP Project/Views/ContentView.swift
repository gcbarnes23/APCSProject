import SwiftUI

struct ContentView: View {
//    @State var city: City = allCities[0]
    @State var filteredCitiesByPopulation = [City]()
    @State var filteredCitiesByLatitude = [City]()
    @State var allCities: [City] = load("cityData.json")
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
            if showCitiesByPop == false && showCitiesByLat == false {
                List(allCities) { city in
                    Text(city.city)
                }
                .navigationTitle("40 Largest Cities in Spain")
                .navigationBarTitleDisplayMode(.inline)
            } else if showCitiesByPop == true && showCitiesByLat == false {
                List(filteredCitiesByPopulation) { city in
                    Text(city.city)
                }
            } else {
                List(filteredCitiesByLatitude) { city in
                    Text(city.city)
                }
            }
            
            HStack {
                Button("Filter by Population > 200000") {
                    self.filteredCitiesByPopulation = self.filter(newList: self.allCities) { city in
                        return city.populationUrban > 200000
                    }
                    showCitiesByPop = true
                    showCitiesByLat = false
                }
                
                Button("Filter by Latitude > 40") {
                    self.filteredCitiesByLatitude = self.filter(newList: self.allCities) { city in
                        return city.latitude > 40.0
                    }
                    showCitiesByPop = false
                    showCitiesByLat = true
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
