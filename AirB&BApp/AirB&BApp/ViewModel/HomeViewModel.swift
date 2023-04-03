//
//  HomeViewModel.swift
//  AirB&BApp
//
//  Created by Berkat Bhatti on 4/2/23.
//

import Foundation
import Combine


class HomeViewModel: ObservableObject {
    @Published var listings = [CityResults]()
    private var cancallables = Set<AnyCancellable>()
    
    
    init() {
        AirService.getListingsForCity(name: "Montclair")
            .sink { comletion in
                switch comletion {
                case .finished:
                    print("Data fetched")
                case .failure(let error):
                    print("There was an error \(error)")
                }
            } receiveValue: { location in
                self.listings = location.data
            }.store(in: &cancallables)

    }
}
