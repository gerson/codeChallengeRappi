//
//  SearchInteractor.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 12/12/2018.
//  Copyright (c) 2018 rappi. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SearchBusinessLogic {
    func search(request: Search.Request)
}

protocol SearchDataStore {
    //var name: String { get set }
}

class SearchInteractor: SearchBusinessLogic, SearchDataStore {
    
    var presenter: SearchPresentationLogic?
    var worker: SearchWorker?
    
    func search(request: Search.Request) {
        var response = Search.Response(items: [])
        worker = SearchWorker()
        worker?.search(text: request.text, completion: {[weak self] (items: [Item]) in
            response.items = items
            self?.presenter?.presentItem(response: response)
            }, failure: { (err: Error) in
                print(err)
        })
    }
}
