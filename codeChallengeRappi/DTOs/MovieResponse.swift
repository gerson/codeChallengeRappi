//
//  MovieResponse.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 09/12/2018.
//  Copyright © 2018 rappi. All rights reserved.
//

import Foundation

public struct MovieResponse: Decodable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}
