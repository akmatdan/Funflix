//
//  MovieURL.swift
//  Funflix
//
//  Created by Daniil Akmatov on 27/4/21.
//

import Foundation

enum MovieURL: String {
    case nowPlaying = "now_playing"
    case upciming = "upcoming"
    case popular = "popular"
    
    public var urlSting: String {
        "baseURL\(self.rawValue)?api_key=\(API.key)&language=en-US&page=1"
    }
}
