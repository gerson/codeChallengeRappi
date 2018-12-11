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
    
    case popularMovies(parameters: Parameters)
    case topRatedMovies(parameters: Parameters)
    case upcomingMovies(parameters: Parameters)
    case popularSeries(parameters: Parameters)
    case topRatedSeries(parameters: Parameters)
    case upcomingSeries(parameters: Parameters)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .popularMovies, .topRatedMovies, .upcomingMovies,
             .popularSeries, .topRatedSeries, .upcomingSeries:
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
        case .popularSeries:
            return "/3/tv/popular"
        case .topRatedSeries:
            return "/3/tv/top_rated"
        case .upcomingSeries:
            return "/3/tv/on_the_air"
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try APIRouter.APIServerURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        switch self {
            case .popularMovies(let parameters), .topRatedMovies(let parameters), .upcomingMovies(let parameters),
                 .popularSeries(let parameters), .topRatedSeries(let parameters), .upcomingSeries(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        }
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
}
