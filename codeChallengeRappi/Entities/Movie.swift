//
//  File.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 09/12/2018.
//  Copyright © 2018 rappi. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class Movie: Object, Decodable {
    @objc dynamic var movieId: Int = 0
    @objc dynamic var posterPath: String? = nil
    @objc dynamic var title: String? = nil
    @objc dynamic var backdropPath: String? = nil
    @objc dynamic var popularity: Double = 0.0
    @objc dynamic var voteCount: Int = 0
    @objc dynamic var video: Bool = false
    @objc dynamic var voteAverage: Double = 0.0
    @objc dynamic var adult: Bool = false
    @objc dynamic var overview: String? = nil
    @objc dynamic var releaseDate: Date? = nil
    var genreList = List<Int>()
    @objc dynamic var originalTitle: String? = nil
    @objc dynamic var originalLanguage: String? = nil
    @objc dynamic var popular: Bool = false
    @objc dynamic var topRated: Bool = false
    @objc dynamic var upcoming: Bool = false
    
    override static func primaryKey() -> String? {
        return "movieId"
    }
    
    override static func indexedProperties() -> [String] {
        return ["title"]
    }
    
    private enum MovieCodingKeys: String, CodingKey {
        case movieId = "id"
        case posterPath = "poster_path"
        case title
        case backdropPath = "backdrop_path"
        case popularity
        case voteCount = "vote_count"
        case video
        case voteAverage = "vote_average"
        case adult
        case overview
        case releaseDate = "release_date"
        case genreList = "genre_ids"
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: MovieCodingKeys.self)
        self.movieId = try container.decode(Int.self, forKey: .movieId)
        self.posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        self.title = try container.decode(String.self, forKey: .title)
        self.backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
        self.popularity = try container.decode(Double.self, forKey: .popularity)
        self.voteCount = try container.decode(Int.self, forKey: .voteCount)
        self.video = try container.decode(Bool.self, forKey: .video)
        self.voteAverage = try container.decode(Double.self, forKey: .voteAverage)
        self.adult = try container.decode(Bool.self, forKey: .adult)
        self.overview = try container.decodeIfPresent(String.self, forKey: .overview)
        self.releaseDate = try container.decode(Date.self, forKey: .releaseDate)
        let genreIds = try container.decodeIfPresent([Int].self, forKey: .genreList) ?? [Int()]
        genreList.append(objectsIn: genreIds)
        self.originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
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
