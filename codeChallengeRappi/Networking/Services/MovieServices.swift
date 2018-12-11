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

    static func getPopular(page: Int, completion: @escaping ([Movie]) -> Void, failure: @escaping (Error) -> Void) {
        let sessionManager = Alamofire.SessionManager.default
        let parameters: Parameters = ["page": page]
        sessionManager.request(APIRouter.popularMovies(parameters: parameters)).responseJSON { response in
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
    
    static func getTopRated(page: Int, completion: @escaping ([Movie]) -> Void, failure: @escaping (Error) -> Void) {
        let sessionManager = Alamofire.SessionManager.default
        let parameters: Parameters = ["page": page]
        sessionManager.request(APIRouter.topRatedMovies(parameters: parameters)).responseJSON { response in
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
    
    static func getUpcoming(page: Int, completion: @escaping ([Movie]) -> Void, failure: @escaping (Error) -> Void) {
        let sessionManager = Alamofire.SessionManager.default
        let parameters: Parameters = ["page": page]
        sessionManager.request(APIRouter.upcomingMovies(parameters: parameters)).responseJSON { response in
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
