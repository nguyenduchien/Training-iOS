//
//  CollectionCell.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/7/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {

    @IBOutlet weak private var imageView: UIImageView!
    var image = UIImage() {
        didSet {
            imageView.image = image
        }
    }
}
