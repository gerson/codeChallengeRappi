//
//  connectivity.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 11/12/2018.
//  Copyright © 2018 rappi. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
    
    static func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
