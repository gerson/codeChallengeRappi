//
//  SerieServices.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 11/12/2018.
//  Copyright © 2018 rappi. All rights reserved.
//

import Foundation
import Alamofire

class SerieServices {
    
    static func getPopular(page: Int, completion: @escaping ([Serie]) -> Void, failure: @escaping (Error) -> Void) {
        let sessionManager = Alamofire.SessionManager.default
        let parameters: Parameters = ["page": page]
        sessionManager.request(APIRouter.popularSeries(parameters: parameters)).responseJSON { response in
            if response.result.isSuccess {
                let json = response.data
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(SerieResponse.self, from: json!)
                    completion(result.results)
                } catch let error {
                    failure(error)
                }
            } else {
                failure(response.result.error!)
            }
        }
    }
    
    static func getTopRated(page: Int, completion: @escaping ([Serie]) -> Void, failure: @escaping (Error) -> Void) {
        let sessionManager = Alamofire.SessionManager.default
        let parameters: Parameters = ["page": page]
        sessionManager.request(APIRouter.topRatedSeries(parameters: parameters)).responseJSON { response in
            if response.result.isSuccess {
                let json = response.data
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(SerieResponse.self, from: json!)
                    completion(result.results)
                } catch let error {
                    failure(error)
                }
            } else {
                failure(response.result.error!)
            }
        }
    }
    
    static func getUpcoming(page: Int, completion: @escaping ([Serie]) -> Void, failure: @escaping (Error) -> Void) {
        let sessionManager = Alamofire.SessionManager.default
        let parameters: Parameters = ["page": page]
        sessionManager.request(APIRouter.upcomingSeries(parameters: parameters)).responseJSON { response in
            if response.result.isSuccess {
                let json = response.data
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(SerieResponse.self, from: json!)
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
