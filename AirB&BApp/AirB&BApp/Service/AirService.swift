//
//  AirService.swift
//  AirB&BApp
//
//  Created by Berkat Bhatti on 4/2/23.
//

import Foundation
import Combine

struct AirService {
    
    static func getListingsForCity(name: String) -> AnyPublisher<Location, Error> {
        let request = getRequestHeader(cityName: name)
        return URLSession.DataTaskPublisher(request: request, session: .shared)
            .map({$0.data})
            .decode(type: Location.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
   private static func getRequestHeader(cityName: String) -> URLRequest {
        
        let headers = [
            "X-RapidAPI-Key": "de1d2e9a71msh0f600e66c3e9995p176880jsnac05f5686a41",
            "X-RapidAPI-Host": "airbnb19.p.rapidapi.com"
        ]

        var request = URLRequest(url: NSURL(string: "https://airbnb19.p.rapidapi.com/api/v1/searchDestination?query=\(cityName)&country=USA")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
       return request
    }
    
    
}
