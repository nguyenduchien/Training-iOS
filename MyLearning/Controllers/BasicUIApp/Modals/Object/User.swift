//
//  User.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/11/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit
class User {
    var avatar: UIImage?
    var name: String
    var comments: [String]
    
    init(name: String, comments: [String] = [], avatar: UIImage? = nil) {
        self.name = name
        self.comments = comments
        self.avatar = avatar
    }
}
