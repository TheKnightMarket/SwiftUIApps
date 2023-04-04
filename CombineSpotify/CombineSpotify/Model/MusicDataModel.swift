//
//  MusicDataModel.swift
//  CombineSpotify
//
//  Created by Berkat Bhatti on 4/4/23.
//

import Foundation


struct MusicDataModel: Codable {
    let albums: Album
}

struct Album: Codable {
    let items: [AlbumList]
}

struct AlbumList: Identifiable, Codable {
    var id: String {
        UUID().uuidString
    }
    let data: AlbumData
}

struct AlbumData: Codable {
    let uri: String?
    let name: String
    let coverArt: CoverArt
}
    
struct CoverArt: Codable {
   let sources: [CoverArtSources]
}

struct CoverArtSources: Codable {
    let url: String
}
