//
//  SearchService.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 12/12/2018.
//  Copyright © 2018 rappi. All rights reserved.
//

import Foundation
import Alamofire

class SearchServices {
    
    static func getSearchResult(with text: String, completion: @escaping ([Item]) -> Void, failure: @escaping (Error) -> Void) {
        let sessionManager = Alamofire.SessionManager.default
        let parameters: Parameters = ["query": text]
        sessionManager.request(APIRouter.search(parameters: parameters)).responseJSON { response in
            if response.result.isSuccess {
                let json = response.data
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(SearchResponse.self, from: json!)
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
