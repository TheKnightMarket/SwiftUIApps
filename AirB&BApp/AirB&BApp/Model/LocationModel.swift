//
//  LocationModel.swift
//  AirB&BApp
//
//  Created by Berkat Bhatti on 4/2/23.
//

import Foundation


struct Location: Codable {
    let data: [CityResults]
}


struct CityResults: Codable, Identifiable {
    let id: String
    let location_name: String
}
