//
//  SerieRepository.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 11/12/2018.
//  Copyright © 2018 rappi. All rights reserved.
//

import Foundation
import RealmSwift

class SerieRepository {
    
    static func getPopular(page: Int, completion: @escaping (Results<Serie>) -> Void, failure: @escaping (Error) -> Void) {
        let realm = RealmWorker.default.realm!
        SerieServices.getPopular(page: page, completion: { (seriess: [Serie]) in
            for serie in seriess {
                serie.popular = true
                try! realm.write {
                    realm.create(Serie.self, value: serie, update: true)
                }
            }
            let predicate = NSPredicate(format: "popular == true")
            let popularSeries = realm.objects(Serie.self).filter(predicate)
            completion(popularSeries)
        }) { (err: Error) in
            failure(err)
        }
    }
    
    static func getTopRated(page: Int, completion: @escaping (Results<Serie>) -> Void, failure: @escaping (Error) -> Void) {
        let realm = RealmWorker.default.realm!
        SerieServices.getTopRated(page: page, completion: { (seriess: [Serie]) in
            for serie in seriess {
                serie.topRated = true
                try! realm.write {
                    realm.create(Serie.self, value: serie, update: true)
                }
            }
            let predicate = NSPredicate(format: "topRated == true")
            let popularSeries = realm.objects(Serie.self).filter(predicate)
            completion(popularSeries)
        }) { (err: Error) in
            failure(err)
        }
    }
    
    static func getUpcoming(page: Int, completion: @escaping (Results<Serie>) -> Void, failure: @escaping (Error) -> Void) {
        let realm = RealmWorker.default.realm!
        SerieServices.getUpcoming(page: page, completion: { (seriess: [Serie]) in
            for serie in seriess {
                serie.upcoming = true
                try! realm.write {
                    realm.create(Serie.self, value: serie, update: true)
                }
            }
            let predicate = NSPredicate(format: "upcoming == true")
            let popularSeries = realm.objects(Serie.self).filter(predicate)
            completion(popularSeries)
        }) { (err: Error) in
            failure(err)
        }
    }
}
