//
//  Exercise3_Delegate.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/13/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class Exercise3_Delegate: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Delegate"
        
        let userView = Exercise2_DemoUserView(frame: CGRect(x: 50, y: 100, width: 100, height: 250))
        userView.delegate = self
        userView.userAvatar?.image = UIImage(named: "Avatar")
        userView.userName?.text = "XuKa"
        view.addSubview(userView)
    }

}
extension Exercise3_Delegate: Exercise3_UserViewDelegate {
    func view(_ view: Exercise2_DemoUserView, needsPerformAction action: Exercise2_DemoUserView.Action) {

        switch action {
        case .didSelected(let index):
            print(index)
        }
    }
}
