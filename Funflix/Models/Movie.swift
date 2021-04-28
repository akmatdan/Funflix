//
//  Movie.swift
//  Funflix
//
//  Created by Daniil Akmatov on 27/4/21.
//

import Foundation

struct MovieResponse: Codable {
    var results: [Movie]
}

struct Movie: Codable, Identifiable {
    var id: Int?
    var title: String?
    var original_language: String?
    var overview: String?
    var poster_path: String?
    var backdrop_path: String?
    var popularity: Double?
    var vote_avarage: Double?
    var vote_count: Int?
    var video: Bool?
    var adult: Bool?
    var release_data: String?
    
    var posterPath: String {
        if let path = poster_path {
            return "hhtp://image.tmdb.org/t/p/original/\(path)"
        }
        return ""
    }
    
    var voteAverage: Double {
        if let avg = vote_avarage {
            return avg / 10.0
        }
        return 0.0
    }
    
    var titleWithLanguage: String {
        guard let title = title, let lang = original_language else { return "" }
        return "\(title)(\(lang))"
    }
}
