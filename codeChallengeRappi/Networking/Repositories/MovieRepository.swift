//
//  MovieRepository.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 09/12/2018.
//  Copyright © 2018 rappi. All rights reserved.
//

import Foundation
import RealmSwift

class MovieRepository {
    
    static func getPopular(completion: @escaping (Results<Movie>) -> Void, failure: @escaping (Error) -> Void) {
        let realm = try! Realm()
        MovieServices.getPopular(completion: { (movies: [Movie]) in
            for movie in movies {
                movie.popular = true
                try! realm.write {
                    realm.create(Movie.self, value: movie, update: true)
                }
            }
            let predicate = NSPredicate(format: "popular == true")
            let popularMovies = realm.objects(Movie.self).filter(predicate)
            completion(popularMovies)
        }) { (err: Error) in
            failure(err)
        }
    }
    
    static func getTopRated(completion: @escaping (Results<Movie>) -> Void, failure: @escaping (Error) -> Void) {
        let realm = try! Realm()
        MovieServices.getTopRated(completion: { (movies: [Movie]) in
            for movie in movies {
                movie.topRated = true
                try! realm.write {
                    realm.create(Movie.self, value: movie, update: true)
                }
            }
            let predicate = NSPredicate(format: "topRated == true")
            let popularMovies = realm.objects(Movie.self).filter(predicate)
            completion(popularMovies)
        }) { (err: Error) in
            failure(err)
        }
    }
    
    static func getUpcoming(completion: @escaping (Results<Movie>) -> Void, failure: @escaping (Error) -> Void) {
        let realm = try! Realm()
        MovieServices.getUpcoming(completion: { (movies: [Movie]) in
            for movie in movies {
                movie.upcoming = true
                try! realm.write {
                    realm.create(Movie.self, value: movie, update: true)
                }
            }
            let predicate = NSPredicate(format: "upcoming == true")
            let popularMovies = realm.objects(Movie.self).filter(predicate)
            completion(popularMovies)
        }) { (err: Error) in
            failure(err)
        }
    }
}
    
