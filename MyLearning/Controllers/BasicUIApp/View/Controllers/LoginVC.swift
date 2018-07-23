//
//  LoginVC.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/9/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var effectView: UIVisualEffectView!
    @IBOutlet weak var usernameView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var containBtnLoginView: UIView!
    
//    @IBAction func loginBtn(_ sender: Any) {
//        if usernameTxt.text == "" || passwordTxt.text == ""{
//            self.showAlert(message: "Vui lòng nhập tài khoản và mật khẩu")
//        }else{
//
//            let userlog = ["username": usernameTxt.text, "password": passwordTxt.text]
//            if let path = Bundle.main.path(forResource: "Login", ofType: "plist") {
//                if let dic = NSDictionary(contentsOfFile: path) as? [String: Any] {
//                    if (NSDictionary(dictionary: dic).isEqual(to: userlog)){
//                        UserDefaults.standard.set(true, forKey: "login")
//                        if let delegate = UIApplication.shared.delegate as? AppDelegate {
//                            delegate.checkLogin()
//                        }
//                    } else {
//                        self.showAlert(message: "Tài khoản hoặc mật khẩu không đúng")
//                    }
//                }
//            }
//        }
//    }
    
    @IBAction func loginBtn(_ sender: Any) {
        if usernameTxt.text == "" || passwordTxt.text == "" {
            self.showAlert(message: "Please input your account and password")
        }else{
            if let path = Bundle.main.path(forResource: "Account", ofType: "plist") {
                if let data = NSArray(contentsOfFile: path) as? Array<Dictionary<String, String>> {
                    for (_, item) in data.enumerated() {
                        if usernameTxt.text == item["email"] && passwordTxt.text == item["password"] {
                            UserDefaults.standard.set(true, forKey: "login")
                            if let delegate = UIApplication.shared.delegate as? AppDelegate {
                                delegate.checkLogin()
                                self.showAlert(message: "Login Success")
                            }
                    } else {
                        self.showAlert(message: "Wrong Account or Password")
                    }
                }
            }
        }
    }
}

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
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
    func initUI() {
        usernameView.setborder(width: 1, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), highborder: 10)
        passwordView.setborder(width: 1, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), highborder: 10)
        loginView.corner(cornerRadius: 10)
        containBtnLoginView.corner(cornerRadius: containBtnLoginView.bounds.size.height/5)
        
    }
}
