import Foundation
import SwiftUI

class CityManager: ObservableObject {
    
    @Published var allCities: [City] = []
    @Published var filteredCitiesByPopulation = [City]()
    @Published var filteredCitiesByLatitude = [City]()
    
    
    init() {
        allCities = load("cityData.json")
    }
    
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
    
    // The load function was written by my teacher in a previous project to load JSON data
    func load<T: Decodable>(_ filename: String) -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}
