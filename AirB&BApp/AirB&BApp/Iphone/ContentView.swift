//
//  ContentView.swift
//  AirB&BApp
//
//  Created by Berkat Bhatti on 4/2/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(homeViewModel.listings) { cityResults in
                    Text("\(cityResults.location_name): \(cityResults.id)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
