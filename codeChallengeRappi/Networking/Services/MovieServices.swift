//
//  MovieServices.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 09/12/2018.
//  Copyright © 2018 rappi. All rights reserved.
//

import Foundation
import Alamofire

class MovieServices {
    
    static func getPopular(completion: @escaping ([Movie]) -> Void, failure: @escaping (Error) -> Void) {
        let sessionManager = Alamofire.SessionManager.default
        sessionManager.request(APIRouter.popularMovies).responseJSON { response in
            if response.result.isSuccess {
                let json = response.data
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(DateFormatter.yyyyMMdd)
                    let result = try decoder.decode(MovieResponse.self, from: json!)
                    completion(result.results)
                } catch let error {
                    failure(error)
                }
            } else {
                failure(response.result.error!)
            }
        }
    }
    
    static func getTopRated(completion: @escaping ([Movie]) -> Void, failure: @escaping (Error) -> Void) {
        let sessionManager = Alamofire.SessionManager.default
        sessionManager.request(APIRouter.topRatedMovies).responseJSON { response in
            if response.result.isSuccess {
                let json = response.data
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(DateFormatter.yyyyMMdd)
                    let result = try decoder.decode(MovieResponse.self, from: json!)
                    completion(result.results)
                } catch let error {
                    failure(error)
                }
            } else {
                failure(response.result.error!)
            }
        }
    }
    
    static func getUpcoming(completion: @escaping ([Movie]) -> Void, failure: @escaping (Error) -> Void) {
        let sessionManager = Alamofire.SessionManager.default
        sessionManager.request(APIRouter.upcomingMovies).responseJSON { response in
            if response.result.isSuccess {
                let json = response.data
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(DateFormatter.yyyyMMdd)
                    let result = try decoder.decode(MovieResponse.self, from: json!)
                    completion(result.results)
                } catch let error {
                    failure(error)
                }
            } else {
                failure(response.result.error!)
            }
        }
    }
}
