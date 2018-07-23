//
//  Exercise1_Avatar.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/11/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class Exercise1_Avatar: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Avatar"
        let frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "Avatar.png"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        view.addSubview(userAvatar)
        
        let userName = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 50))
        userName.text = "Username 1"
        userName.backgroundColor = .lightGray
        userName.textColor = .blue
        userName.textAlignment = .center
        view.addSubview(userName)
        
        let button = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 250))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        view.addSubview(button)
    }
    @objc func buttonDidClick() {
        print("Button is clicked")
    }
    


}
