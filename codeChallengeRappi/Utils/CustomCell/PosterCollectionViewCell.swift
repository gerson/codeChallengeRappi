//
//  PosterCollectionViewCell.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 11/12/2018.
//  Copyright © 2018 rappi. All rights reserved.
//

import UIKit
import Kingfisher

class PosterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    var posterPath: String? {
        didSet {
            imageView.image = #imageLiteral(resourceName: "placeholder")
            if let posterPath = self.posterPath {
                imageView.kf.indicatorType = .activity
                let url = URL(string: "https://image.tmdb.org/t/p/w185/\(posterPath)")
                imageView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"))
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
