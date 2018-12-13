//
//  SeriesInteractor.swift
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

protocol SeriesBusinessLogic {
    func fetchSeries(request: Series.Request)
}

protocol SeriesDataStore {
    //var name: String { get set }
}

class SeriesInteractor: SeriesBusinessLogic, SeriesDataStore {
    var presenter: SeriesPresentationLogic?
    var worker: SeriesWorkerProtocol = SeriesWorker()
    
    func fetchSeries(request: Series.Request) {
        var response = Series.Response(series: [])
        worker.fetchByCategoy(page: request.page, category: request.category, completion: {[weak self] (results: [Serie]) in
            response.series = results
            self?.presenter?.presentSeries(response: response)
            }, failure: { (err: Error) in
                print(err)
        })
    }
}
