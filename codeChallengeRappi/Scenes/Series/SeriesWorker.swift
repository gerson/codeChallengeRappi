//
//  SeriesWorker.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 11/12/2018.
//  Copyright (c) 2018 rappi. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import RealmSwift

protocol SeriesWorkerProtocol {
    func fetchByCategoy(page: Int, category: Categories, completion: @escaping ([Serie]) -> Void, failure: @escaping (Error) -> Void)
}

class SeriesWorker: SeriesWorkerProtocol {
    
    func fetchByCategoy(page: Int, category: Categories, completion: @escaping ([Serie]) -> Void, failure: @escaping (Error) -> Void) {
        switch category {
        case .TopRated:
            SerieRepository.getTopRated(page: page, completion: { (results: Results<Serie>) in
                completion(results.toArray(type: Serie.self))
            }) { (err: Error) in
                failure(err)
            }
        case .Upcoming:
            SerieRepository.getUpcoming(page: page, completion: { (results: Results<Serie>) in
                completion(results.toArray(type: Serie.self))
            }) { (err: Error) in
                failure(err)
            }
        default:
            SerieRepository.getPopular(page: page, completion: { (results: Results<Serie>) in
                completion(results.toArray(type: Serie.self))
            }) { (err: Error) in
                failure(err)
            }
        }
        
    }
}
