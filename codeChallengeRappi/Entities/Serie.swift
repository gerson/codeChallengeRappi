//
//  Serie.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 11/12/2018.
//  Copyright © 2018 rappi. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class Serie: Object, Decodable {
    @objc dynamic var serieId: Int = 0
    @objc dynamic var posterPath: String? = nil
    @objc dynamic var name: String? = nil
    @objc dynamic var backdropPath: String? = nil
    @objc dynamic var popularity: Double = 0.0
    @objc dynamic var voteCount: Int = 0
    @objc dynamic var voteAverage: Double = 0.0
    @objc dynamic var overview: String? = nil
    var genreList = List<Int>()
    @objc dynamic var originalName: String? = nil
    @objc dynamic var originalLanguage: String? = nil
    @objc dynamic var popular: Bool = false
    @objc dynamic var topRated: Bool = false
    @objc dynamic var upcoming: Bool = false
    
    override static func primaryKey() -> String? {
        return "serieId"
    }
    
    override static func indexedProperties() -> [String] {
        return ["name"]
    }
    
    private enum MovieCodingKeys: String, CodingKey {
        case serieId = "id"
        case posterPath = "poster_path"
        case overview
        case genreList = "genre_ids"
        case originalName = "original_name"
        case originalLanguage = "original_language"
        case name
        case backdropPath = "backdrop_path"
        case popularity
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: MovieCodingKeys.self)
        self.serieId = try container.decode(Int.self, forKey: .serieId)
        self.posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
        self.popularity = try container.decode(Double.self, forKey: .popularity)
        self.voteCount = try container.decode(Int.self, forKey: .voteCount)
        self.voteAverage = try container.decode(Double.self, forKey: .voteAverage)
        self.overview = try container.decodeIfPresent(String.self, forKey: .overview)
        let genreIds = try container.decodeIfPresent([Int].self, forKey: .genreList) ?? [Int()]
        genreList.append(objectsIn: genreIds)
        self.originalName = try container.decodeIfPresent(String.self, forKey: .originalName)
        self.originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage)
    }
    
    required init() {
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
}
