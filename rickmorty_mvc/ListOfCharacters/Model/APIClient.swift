//
//  APIClient.swift
//  rickmorty_mvc
//
//  Created by Administrador on 01/12/2023.
//

import Foundation

final class ListOfCharactersApiClient {
    
    func getListOfCharacters() async -> CharacterModelResponde {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(CharacterModelResponde.self, from: data)
    }
    
}
