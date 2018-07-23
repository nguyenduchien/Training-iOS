//
//  PlaceCellModel.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/11/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//
import UIKit
import Foundation
class PlaceCellModel {

    var image: UIImage?
    var name = ""
    var address = ""
    var rate = ""
    init(image: UIImage, name: String, address: String, rate: String) {
        self.image = image
        self.name = name
        self.address = address
        self.rate = rate
    }
}
