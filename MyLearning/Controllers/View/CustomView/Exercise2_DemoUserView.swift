//
//  Exercise2_DemoUserView.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/11/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class Exercise2_DemoUserView: UIView {
    
    enum Action {
        case didSelected(index: Int)
    }
    
    var delegate : Exercise3_UserViewDelegate?
    var userAvatar: UIImageView?
    var userName: UILabel?
    override init(frame: CGRect) {
        super.init(frame: frame)
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "Avatar.png"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        addSubview(userAvatar)
        
        let userName = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 25))
        userName.text = "Username 1"
        userName.backgroundColor = .lightGray
        userName.textColor = .blue
        userName.textAlignment = .center
        addSubview(userName)
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 250))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        addSubview(button)
        
        
    }
    @objc func buttonClick(){
        print("Button is clicked")
        delegate?.view(self, needsPerformAction: .didSelected(index: 999))


    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
