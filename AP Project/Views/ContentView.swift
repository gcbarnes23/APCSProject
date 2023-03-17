//
//  ContentView.swift
//  AP Project
//
//  Created by Grace Barnes23 on 3/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            List(allCities) { city in
               Text(city.city)
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
