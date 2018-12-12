//
//  SearchResponse.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 12/12/2018.
//  Copyright © 2018 rappi. All rights reserved.
//

import Foundation

public struct SearchResponse: Codable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [Item]
    
    private enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}

public struct Item: Codable {
    let name: String?
    let posterPath: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case posterPath = "poster_path"
    }
}
