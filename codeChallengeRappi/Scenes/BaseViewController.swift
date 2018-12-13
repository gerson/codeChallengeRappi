//
//  BaseViewController.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 11/12/2018.
//  Copyright © 2018 rappi. All rights reserved.
//

import UIKit
import SwiftMessages

class BaseViewController: UIViewController {
    
    let kCellIdentifier = "posterCollectionCell"
    let kNumberOfItemByPage = 20
    var currentCategory: Categories = .Popular
    
    
    func fetchPopular(page: Int = 1) {
        if !Connectivity.isConnectedToInternet() {
            noInternetConnection()
        }
    }
    
    func fetchTopRated(page: Int = 1) {
        if !Connectivity.isConnectedToInternet() {
            noInternetConnection()
        }
    }
    
    func fetchUpcoming(page: Int = 1) {
        if !Connectivity.isConnectedToInternet() {
            noInternetConnection()
        }
    }
    
    func fetchByCategory(categoryIndex: Int = 0) {
        switch categoryIndex {
        case 1:
            currentCategory = .TopRated
            fetchTopRated()
        case 2:
            currentCategory = .Upcoming
            fetchUpcoming()
        default:
            currentCategory = .Popular
            fetchPopular()
        }
    }
    
    func noInternetConnection() {
        let view: MessageView = try! SwiftMessages.viewFromNib()
        view.accessibilityPrefix = title
        view.configureContent(title: "No internet", body: "Check your internet connection.")
        view.configureDropShadow()
        view.button?.isHidden = true
        view.iconImageView?.isHidden = true
        view.iconLabel?.isHidden = true
        //Theme setup
        view.button?.setTitle(nil, for: .normal)
        view.button?.backgroundColor = UIColor.clear
        view.button?.tintColor = UIColor.green.withAlphaComponent(0.7)
        // Config setup
        var config = SwiftMessages.defaultConfig
        config.shouldAutorotate = true
        config.interactiveHide = true
        config.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
        // Show
        SwiftMessages.show(config: config, view: view)
        view.configureTheme(.warning)
    }

}
