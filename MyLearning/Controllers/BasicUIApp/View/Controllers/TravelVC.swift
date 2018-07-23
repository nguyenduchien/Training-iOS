//
//  TravelVC.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/9/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class TravelVC: UIViewController {
    
    
    @IBOutlet weak var containBtnLoginView: UIView!
    @IBOutlet weak var containBtnSignupView: UIView!
    @IBOutlet weak var containBtnForgotpassView: UIView!
    
    
    @IBAction func loginBtn(_ sender: Any) {
        let loginController = LoginVC()
        self.addChildViewController(loginController)
        loginController.view.frame = self.view.bounds
        self.view.addSubview(loginController.view)
        //di chuyen tren chinh man hinh` main
        loginController.didMove(toParentViewController: self)
        loginController.view.alpha = 0.0
        //vi tri ban dau khi di chuyen
        loginController.view.transform = CGAffineTransform(translationX: 0, y: 300)
        UIView.animate(withDuration: 0.5, animations: {
            loginController.effectView.alpha = 0.7
            loginController.view.alpha = 1
            loginController.view.transform  = .identity
            self.view.layoutIfNeeded()
        }) { (true) in
        }
    }
    @IBAction func signupBtn(_ sender: Any) {
        let registerController = RegisterVC()
        self.addChildViewController(registerController)
        registerController.view.frame = self.view.bounds
        self.view.addSubview(registerController.view)
        registerController.didMove(toParentViewController: self)
        registerController.view.transform = CGAffineTransform(translationX: 0, y: 300)
        UIView.animate(withDuration: 0.5, animations: {
            registerController.effectView.alpha = 0.7
            registerController.view.alpha = 1
            registerController.view.transform  = .identity
            self.view.layoutIfNeeded()
        }) { (true) in
            
        }
    }
    @IBAction func forgotpassBtn(_ sender: Any) {
        let forgotpassController = ForgotPasswordVC()
        self.addChildViewController(forgotpassController)
        forgotpassController.view.frame = self.view.bounds
        self.view.addSubview(forgotpassController.view)
        forgotpassController.didMove(toParentViewController: self)
        forgotpassController.view.transform = CGAffineTransform(translationX: 0, y: 300)
        UIView.animate(withDuration: 0.5, animations: {
            forgotpassController.effectView.alpha = 0.7
            forgotpassController.view.alpha = 1
            forgotpassController.view.transform  = .identity
            self.view.layoutIfNeeded()
        }) { (true) in
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    func initUI() {
        containBtnLoginView.corner(cornerRadius: containBtnLoginView.bounds.size.height/5)
        containBtnSignupView.corner(cornerRadius: containBtnSignupView.bounds.size.height/5)
        containBtnForgotpassView.corner(cornerRadius: containBtnForgotpassView.bounds.size.height/5)
        //hide navigation
        self.navigationController?.navigationBar.isHidden = true
    }
}
