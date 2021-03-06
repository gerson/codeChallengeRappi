//
//  MoviesWorker.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 09/12/2018.
//  Copyright (c) 2018 rappi. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation
import RealmSwift

enum Categories: String {
    case Popular, TopRated, Upcoming
}

protocol MoviesWorkerProtocol {
    func fetchByCategoy(category: Categories, page: Int, completion: @escaping ([Movie]) -> Void, failure: @escaping (Error) -> Void)
}

class MoviesWorker: MoviesWorkerProtocol {
    
    func fetchByCategoy(category: Categories, page: Int, completion: @escaping ([Movie]) -> Void, failure: @escaping (Error) -> Void) {
        switch category {
        case .TopRated:
            MovieRepository.getTopRated(page: page, completion: { (results: Results<Movie>) in
                completion(results.toArray(type: Movie.self))
            }) { (err: Error) in
                failure(err)
            }
        case .Upcoming:
            MovieRepository.getUpcoming(page: page, completion: { (results: Results<Movie>) in
                completion(results.toArray(type: Movie.self))
            }) { (err: Error) in
                failure(err)
            }
        default:
            MovieRepository.getPopular(page: page, completion: { (results: Results<Movie>) in
                completion(results.toArray(type: Movie.self))
            }) { (err: Error) in
                failure(err)
            }
        }
        
    }
}
