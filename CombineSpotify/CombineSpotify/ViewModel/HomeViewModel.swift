//
//  HomeViewModel.swift
//  CombineSpotify
//
//  Created by Berkat Bhatti on 4/4/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var albums = [AlbumList]()
    private var cancellable = Set<AnyCancellable>()
    
    
    init() {
        MusicService.getMusicData()
            .sink { completion in
            switch completion {
            case .failure(let error):
                print("There was an error \(error)")
            case .finished:
                print("Music Data fetched")
            }
        } receiveValue: { musicModel in
            self.albums = musicModel.albums.items
        }.store(in: &cancellable)

    }
}
