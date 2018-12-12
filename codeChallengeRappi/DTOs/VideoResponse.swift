//
//  VideoResponse.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 12/12/2018.
//  Copyright © 2018 rappi. All rights reserved.
//

import Foundation

public struct VideoResponse: Codable {
    let id: Int
    let results: [Video]
    
    private enum CodingKeys: String, CodingKey {
        case id
        case results
    }
}

public struct Video: Codable {
    let key: String
    let name: String
    let site: String
    
    private enum CodingKeys: String, CodingKey {
        case key
        case name
        case site
    }
}
