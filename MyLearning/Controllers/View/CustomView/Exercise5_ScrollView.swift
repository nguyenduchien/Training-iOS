//
//  Exercise5_ScrollView.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/13/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class Exercise5_ScrollView: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        self.title = "ScrollView"
        super.viewDidAppear(animated)
        let space: Int = Int((UIScreen.main.bounds.width - 300) / 4)
        var pointY: Int = 50
        var pointX: Int = space
        let scrollView = UIScrollView(frame: UIScreen.main.bounds)
        scrollView.isScrollEnabled = true;

        for position in 0...29 {
            if position > 0 && position % 3 == 0 {
                pointY += 150
                pointX = space
            }
            if let avatarView = Bundle.main.loadNibNamed("Exercise4_LoadNibname", owner: self, options: nil)?[0] as? Exercise4_LoadNibname {
                
                avatarView.frame = CGRect(x: pointX, y: pointY, width: 100, height: 125)
                avatarView.userAvatar.image = UIImage(named: "tomhardy")
                avatarView.userAvatar.corner(cornerRadius: (avatarView.userAvatar.bounds.height) / 2)
                avatarView.userAvatar.contentMode = .scaleAspectFit
                avatarView.userName.text = "User \(position + 1)"
                avatarView.userName.textColor = .cyan
                avatarView.userName.textAlignment = .center
                avatarView.userName.backgroundColor = .lightGray
                avatarView.border(width: 1, color: .black)
                avatarView.delegate2 = self
                pointX += 100 + space
                avatarView.tag = position
                scrollView.addSubview(avatarView)

            }
        }
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: 0, height: CGFloat(pointY) + 150)
    }
}

extension Exercise5_ScrollView: AvatarViewDelegate {
    func view(_ view: Exercise4_LoadNibname, needsPerformAction action: Exercise4_LoadNibname.Action) {
        switch action {
        case .didSelected(let position):
            print(position)
        }
    }

}
