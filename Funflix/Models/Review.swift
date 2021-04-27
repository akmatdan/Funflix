//
//  Review.swift
//  Funflix
//
//  Created by Daniil Akmatov on 27/4/21.
//

import Foundation

struct ReviewResponse: Codable {
    var results: [Review]
}

struct Review: Codable, Identifiable {
    var id: Int?
    var author: String?
    var content: String?
}
