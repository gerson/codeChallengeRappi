//
//  APIRouter.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 09/12/2018.
//  Copyright © 2018 rappi. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    static let APIServerURL = Bundle.main.infoDictionary!["TMDbAPIURL"] as! String
    
    case popularMovies
    case topRatedMovies
    case upcomingMovies
    case shows
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .popularMovies, .topRatedMovies, .upcomingMovies, .shows:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .popularMovies:
            return "/3/movie/popular"
        case .topRatedMovies:
            return "/3/movie/top_rated"
        case .upcomingMovies:
            return "/3/movie/upcoming"
        case .shows:
            return "/posts"
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try APIRouter.APIServerURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
}
