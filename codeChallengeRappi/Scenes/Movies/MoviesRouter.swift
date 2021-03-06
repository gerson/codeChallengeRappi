//
//  MoviesRouter.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 09/12/2018.
//  Copyright (c) 2018 rappi. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class MoviesRouter {
  weak var viewController: MoviesViewController?
  
  // MARK: Routing
  func routeToDetail(detailModel: DetailModel) {
    let detailVC = UIStoryboard(name: "DetailsViewController", bundle: nil).instantiateInitialViewController() as! DetailsViewController
    detailVC.detailModel = detailModel
    viewController?.navigationController?.pushViewController(detailVC, animated: true)
  }
    
}
