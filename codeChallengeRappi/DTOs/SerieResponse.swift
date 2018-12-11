//
//  SerieResponse.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 11/12/2018.
//  Copyright © 2018 rappi. All rights reserved.
//

import Foundation

public struct SerieResponse: Decodable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [Serie]
    
    private enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}
