//
//  VideoViewController.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 12/12/2018.
//  Copyright © 2018 rappi. All rights reserved.
//

import UIKit
import WebKit

class VideoViewController: UIViewController {

    var videoKey: String?
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let videoKey = videoKey {
            let urlRequest = URLRequest(url: URL(string: "https://www.youtube.com/embed/\(videoKey)")!)
            webView.load(urlRequest)
        }
        
        let origImage = #imageLiteral(resourceName: "cancel")
        let tintedImage = origImage.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        cancelButton.setImage(tintedImage, for: .normal)
        cancelButton.tintColor = UIColor.red
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
