//
//  Exercise2_ListUser.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/11/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class Exercise2_ListUser: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ListUser"
        let space: Int = Int((UIScreen.main.bounds.width - 300) / 4)
        var pointY: Int = 80
        var pointX: Int = space
        for position in 1...9 {
            if position > 1 && position % 3 == 1 {
                pointY += 150
                pointX = space
            }
            let userView = UIView(frame: CGRect(x: pointX, y: pointY, width: 100, height: 125))
            userView.layer.borderWidth = 1
            userView.layer.borderColor = UIColor.darkGray.cgColor
            view.addSubview(userView)
            userView.tag = position
            
            let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            let userAvatar = UIImageView(image: UIImage(named: "Avatar.png"))
            userAvatar.frame = frame
            userAvatar.contentMode = .scaleToFill
            userView.addSubview(userAvatar)
            
            let userName = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 25))
            userName.text = "Hotgirl \(position)"
            userName.backgroundColor = .lightGray
            userName.textColor = .cyan
            userName.textAlignment = .center
            userView.addSubview(userName)

        pointX += 100 + space
            let tap = UITapGestureRecognizer(target: self, action: #selector(Exercise2_ListUser.tapUser))
            userView.addGestureRecognizer(tap)
            
    }
        
  }
    @objc func tapUser(_ sender: UITapGestureRecognizer) {
        print("This is HotGirl \(sender.view!.tag)")
    }
    //       let userView = Exercise2_DemoUserView(frame: CGRect(x: 50, y: 100, width: 100, height: 250))
    //        view.addSubview(userView)
}
