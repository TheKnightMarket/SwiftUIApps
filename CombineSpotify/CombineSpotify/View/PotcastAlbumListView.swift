//
//  PotcastAlbumListView.swift
//  CombineSpotify
//
//  Created by Berkat Bhatti on 4/4/23.
//

import SwiftUI

struct PotcastAlbumListView: View {
    
    var albumData: AlbumData
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.black.opacity(0.4), Color.black.opacity(0.5)], startPoint: .top, endPoint: .bottomTrailing)
            
            HStack {
                AsyncImage(url: URL(string: albumData.coverArt.sources[0].url)!) { image in
                    image
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                } placeholder: {
                    Image(systemName: "mic")
                }
                
                Text(albumData.name)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(.blue)

            }
        }
        .frame(height: 200)
        .cornerRadius(12)
    }
}

struct PotcastAlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        PotcastAlbumListView(albumData: AlbumData(uri: "", name: "", coverArt: CoverArt(sources: [CoverArtSources(url: "https://www.rd.com/wp-content/uploads/2021/05/GettyImages-1271148946-e1620838088898.jpg")])))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
