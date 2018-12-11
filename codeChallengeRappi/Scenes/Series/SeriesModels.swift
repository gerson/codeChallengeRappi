//
//  SeriesModels.swift
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

enum Series {
  // MARK: Use cases
    struct Request {
        var category: Categories
    }
    
    struct Response {
        var series: [Serie]
    }
    
    struct ViewModel {
        struct DisplayedSerie {
            var title: String?
            var posterPath: String?
            var releaseDate: Date?
            var overview: String?
        }
        
        var displayedSeries: [DisplayedSerie]
    }
}
