//
//  Categoria.swift
//  T2-Base
//
//  Created by Suite on 17/12/25.
//

import Foundation

struct Categoria: Codable {
    let id: Int
    let nombre: String
    let imagenURL: String

    enum CodingKeys: String, CodingKey {
        case id
        case nombre
        case imagenURL = "imagen_url"
    }
}
