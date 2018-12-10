//
//  APIHeadersAdapter.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 09/12/2018.
//  Copyright © 2018 rappi. All rights reserved.
//

import Foundation
import Alamofire

// MARK: - Use an Alamofire RequestAdapter to add headers to all calls in the session
class APIServiceAdapter: RequestAdapter {
    
    let TMDbAPIKey = Bundle.main.infoDictionary!["TMDbAPIKey"] as! String
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        let urlRequest = urlRequest
        let params: Parameters = ["api_key": TMDbAPIKey]
        
        return try URLEncoding.queryString.encode(urlRequest, with: params)
    }
}
