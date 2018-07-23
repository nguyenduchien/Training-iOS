//
//  ThumbnailCell.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/3/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class ThumbnailCell: UICollectionViewCell {
    @IBOutlet weak var thumbnailImage: UIImageView!
    var thumbnail: UIImage? {
        get {
            return thumbnailImage.image
        }
        set {
            thumbnailImage.image = newValue
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
