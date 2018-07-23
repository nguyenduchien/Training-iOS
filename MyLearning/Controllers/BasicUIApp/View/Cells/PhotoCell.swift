//
//  PhotoCell.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/11/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {

    @IBOutlet weak private var imageView: UIImageView!
    var image = UIImage() {
        didSet {
            imageView.image = image
        }
    }
}
