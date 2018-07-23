//
//  Food.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/8/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//
import Foundation
import UIKit
struct Place {
 var nameCity: String
 var imageName: UIImage
 var addressCity: String
 var description: String
 var rate: String
 var listImage: [UIImage]
 var isFavorite : Bool = false
    
    init(nameCity: String, imageName: UIImage, addressCity: String, description: String, rate: String, listImage :[UIImage], isFavorite: Bool = false) {
        self.nameCity = nameCity
        self.imageName = imageName
        self.addressCity = addressCity
        self.description = description
        self.rate = rate
        self.listImage = listImage
        self.isFavorite = isFavorite
    }
}
//var getNameCity: String {
//    get {
//        return nameCity
//    }
//}
//
//var getImageName: UIImage? {
//    get {
//        return imageName
//    }
//}
//
//var getAddressCity: String {
//    get {
//        return addressCity
//    }
//}
//
//var getDescription: String {
//    get {
//        return description
//    }
//}
//var getRate: String {
//    get {
//        return rate
//    }
//}
//func getdata() -> [Place] {
//    return places
//    }
