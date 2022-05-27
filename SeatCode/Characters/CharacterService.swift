//
//  CharacterService.swift
//  SeatCode
//
//  Created by Diego on 27/5/22.
//

import Foundation

class CharacterService {
    
    let url = Endpoints.list.url
    
    func fetch() async throws -> [Result] {
        let (data,_) = try await URLSession.shared.data(from: URL(string: Endpoints.list.url)!)
        let welcome = try JSONDecoder().decode(Welcome.self, from: data)
        return welcome.data.results
    }
    
}

enum Endpoints: String {
    case list = "https://gateway.marvel.com:443/v1/public/characters?apikey=c9bea7bed2678e12c5c9414609f35bdd&ts=1&hash=129b4cbd75440e6445c54443e5cfae14"
    

    var url: String {
        rawValue
    }
}
