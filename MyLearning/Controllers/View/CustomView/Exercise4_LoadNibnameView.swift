//
//  Exercise4_LoadNibnameView.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/13/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class Exercise4_LoadNibnameView: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "LoadNibname"
        
        let userView = Exercise2_DemoUserView(frame: CGRect(x: 50, y: 100, width: 100, height: 250))
        userView.userAvatar?.image = UIImage(named: "Avatar")
        userView.userName?.text = "XuKa"
        view.addSubview(userView)
        let avatarView = Bundle.main.loadNibNamed("Exercise4_LoadNibname", owner: self, options: nil)?[0] as? Exercise4_LoadNibname
        avatarView?.frame = CGRect(x: 50, y: 250, width: 100, height: 250)
        avatarView?.userAvatar.image = UIImage(named: "Sojisub")
        avatarView?.userAvatar.layer.cornerRadius = (avatarView?.userAvatar.bounds.height)! / 2
        avatarView?.userAvatar.clipsToBounds = true
        avatarView?.userAvatar.contentMode = .scaleAspectFit
        avatarView?.userName.text = "So Ji Sub"
        avatarView?.userName.textColor = .cyan
        avatarView?.userName.textAlignment = .center
        avatarView?.userName.backgroundColor = .lightGray
        view.addSubview(avatarView!)

    }
}
