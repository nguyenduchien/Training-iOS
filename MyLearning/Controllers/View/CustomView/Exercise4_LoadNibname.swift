//
//  Exercise4_LoadNibname.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/13/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit
protocol AvatarViewDelegate: class {
   func view(_ view: Exercise4_LoadNibname, needsPerformAction action: Exercise4_LoadNibname.Action)
}
class Exercise4_LoadNibname: UIView {
    enum Action {
        case didSelected(name: String)
    }
    var delegate2 :AvatarViewDelegate?
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var userName: UILabel!
    var name: String? {
        set {
            userName.text = newValue
        }
        get {
            return userName.text
        }
    }
    @IBAction func buttonDidClick(_ sender: Any) {
        print("Button did clicked")
        delegate2?.view(self, needsPerformAction: .didSelected(name: name!))
        
    }
}
