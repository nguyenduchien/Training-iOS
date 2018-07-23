//
//  DetailModel.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/11/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//
import UIKit
import Foundation
final class DetailPlaceModel {
    var name = ""
    var image: UIImage
    var address = ""
    var rate = ""
    var description = ""
    var images: [UIImage] = []
    var isFavorite : Bool = false
    
    init(name: String, address: String, image: UIImage, rate: String, description: String, images: [UIImage], isFavorite : Bool = false) {
        self.name = name
        self.address = address
        self.image = image
        self.description = description
        self.rate = rate
        self.images = images
        self.isFavorite = isFavorite
        
    }  
}
