//
//  ResultsExtension.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 10/12/2018.
//  Copyright © 2018 rappi. All rights reserved.
//

import Foundation
import RealmSwift

extension Results {
    func toArray<T>(type: T.Type) -> [T] {
        return compactMap { $0 as? T }
    }
}
