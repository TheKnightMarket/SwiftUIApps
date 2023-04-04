//
//  MusicService.swift
//  CombineSpotify
//
//  Created by Berkat Bhatti on 4/4/23.
//

import Foundation
import Combine

struct MusicService {
    
    static func getMusicData() -> AnyPublisher<MusicDataModel, Error> {
        let request = getDataRequest()
        return URLSession.DataTaskPublisher(request: request, session: .shared)
            .map({$0.data})
            .decode(type: MusicDataModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    private static func getDataRequest() -> URLRequest {
        let headers = [
            "X-RapidAPI-Key": "de1d2e9a71msh0f600e66c3e9995p176880jsnac05f5686a41",
            "X-RapidAPI-Host": "spotify81.p.rapidapi.com"
        ]

        var request = URLRequest(url: NSURL(string: "https://spotify81.p.rapidapi.com/search?q=podcasts&type=multi&offset=0&limit=10&numberOfTopResults=20")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        return request
    }
}
