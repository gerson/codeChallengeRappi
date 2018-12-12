//
//  RealmWorker.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 11/12/2018.
//  Copyright © 2018 rappi. All rights reserved.
//

import Foundation
import RealmSwift

class RealmWorker {
    var realm: Realm! = try! Realm()
    var notificationToken: NotificationToken?
    
    // MARK: Object lifecycle
    
    static let `default` = RealmWorker()
    
    private init() {}
    
    deinit {
        notificationToken?.invalidate()
    }
}
