//
//  Anime.swift
//  AnimeSearch
//
//  Created by Matheus Dionísio on 25/06/24.
//

import Foundation

struct Anime: Decodable {
    
    var anilist: Int?
    var filename: String?
    var episode: Int?
    var from: Double?
    var to: Double?
    var similarity: Double?
    var video: String?
    var image: String?
}
