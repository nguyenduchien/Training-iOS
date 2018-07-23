//
//  ForgotPasswordVC.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/8/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var forgotpassView: UIView!
    @IBOutlet weak var effectView: UIVisualEffectView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var containBtnForgotPassView: UIView!
    @IBAction func forgotpassBtn(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapToBack(tap:)))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        self.effectView.addGestureRecognizer(tap)
        self.effectView.alpha = 0
    }
    @objc func tapToBack(tap:UIGestureRecognizer){
        UIView.animate(withDuration: 0.5, animations: {
            self.effectView.alpha = 0.0
            self.view.alpha = 0
            self.view.transform  = CGAffineTransform(translationX: 0, y: 300)
        }) { (true) in
            self.view.removeFromSuperview()
            self.view.transform = .identity
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        emailView.setborder(width: 1, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), highborder: 10)
        forgotpassView.corner(cornerRadius: 10)
        containBtnForgotPassView.corner(cornerRadius: containBtnForgotPassView.bounds.size.height/5)
    }
}
