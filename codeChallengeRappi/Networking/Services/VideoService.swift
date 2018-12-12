//
//  VideoService.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 12/12/2018.
//  Copyright © 2018 rappi. All rights reserved.
//

import Foundation
import Alamofire

class VideoServices {
    
    static func getMovieVideo(with movieId: Int, completion: @escaping ([Video]) -> Void, failure: @escaping (Error) -> Void) {
        let sessionManager = Alamofire.SessionManager.default
        sessionManager.request(APIRouter.movieVideo(videoId: movieId)).responseJSON { response in
            if response.result.isSuccess {
                let json = response.data
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(VideoResponse.self, from: json!)
                    completion(result.results)
                } catch let error {
                    failure(error)
                }
            } else {
                failure(response.result.error!)
            }
        }
    }
    
    static func getSerieVideo(with serieId: Int, completion: @escaping ([Video]) -> Void, failure: @escaping (Error) -> Void) {
        let sessionManager = Alamofire.SessionManager.default
        sessionManager.request(APIRouter.serieVideo(serieId: serieId)).responseJSON { response in
            if response.result.isSuccess {
                let json = response.data
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(VideoResponse.self, from: json!)
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
