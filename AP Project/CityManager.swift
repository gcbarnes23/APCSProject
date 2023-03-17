//
//  CityManager.swift
//  AP Project
//
//  Created by Grace Barnes23 on 3/15/23.
//

import Foundation
import SwiftUI

var allCities: [City] = load("cityData.json")



// The load function was written by my teacher in a previous project
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

// Error I got:
// AP Project crashed due to fatalError in CityManager.swift at line 34.
// Couldn't parse cityData.json as Array<City>:

