//
//  CharacterModel.swift
//  rickmorty_mvc
//
//  Created by Administrador on 01/12/2023.
//

import Foundation

struct CharacterModel: Decodable {
    let name:String
    let status:String
    let species:String
    let image:String
}
