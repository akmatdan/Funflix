//
//  Cast.swift
//  Funflix
//
//  Created by Daniil Akmatov on 27/4/21.
//

import Foundation

struct CastResponse: Codable {
    var cast: [Cast]
}

struct Cast: Codable, Identifiable {
    var id: Int?
    var name: String?
    var character: String?
    var profile_path: String?
    var profilePhoto: String {
        if let path = profile_path {
            return "https://image.tmdb.org/t/p/original/\(path)"
        }
        return "hhtps://piscum.photo/200/300"
    }
}
