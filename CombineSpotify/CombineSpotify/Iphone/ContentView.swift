//
//  ContentView.swift
//  CombineSpotify
//
//  Created by Berkat Bhatti on 4/4/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var homeVM = HomeViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(homeVM.albums) { album in
//                    Text(album.data.name)
                    PotcastAlbumListView(albumData: album.data)
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
