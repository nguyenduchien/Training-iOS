//
//  LoginViewController.swift
//  MyLearning
//
//  Created by Quang Dang N.K on 4/3/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
var loginView = UIView()
var backgroundImage = UIImageView()
var titleLbl = UILabel()
var usernameTxt: UITextField!
var passwordTxt: UITextField!
var loginBtn:UIButton = UIButton()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        self.autolayoutloginView()
        self.autolayoutBackgroundImage()
        self.autolayoutTitleLbl()
        self.autolayoutUsernameTxt()
        self.autolayoutPasswordTxt()
        self.autolayoutLoginBtn()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func autolayoutloginView() {
        view.addSubview(loginView)
        /*
         NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[loginView]-10-|",
         options: [],
         metrics: nil,
         views: ["loginView": loginView]))
         NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[loginView]-10-|",
         options: [],
         metrics: nil,
         views: ["loginView": loginView]))
         */
        //leadingAnchor && leftAnchor
        loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        loginView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        
    }
    private func autolayoutBackgroundImage() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.backgroundColor = UIColor(patternImage: UIImage(named: "Bitmap")!)
        backgroundImage.contentMode = .scaleAspectFit
        view.addSubview(backgroundImage)
        }
    
    private func autolayoutTitleLbl() {
        let titleLbl = UILabel(frame: CGRect(x: UIScreen.main.bounds.midX-200, y: UIScreen.main.bounds.midY - 250, width: 400, height: 30))
        titleLbl.textAlignment = .center
        titleLbl.font = UIFont.boldSystemFont(ofSize: CGFloat(12))
        titleLbl.text = "Wellcome back - Please login to go Home"
        titleLbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.addSubview(titleLbl)
        }
    private func autolayoutUsernameTxt() {
        usernameTxt = UITextField(frame: CGRect(x: 30, y: UIScreen.main.bounds.midY - 200, width: 300, height: 50))
        usernameTxt.placeholder = "Username"
        autolayoutTxtField(a: usernameTxt)
        }
    private func autolayoutPasswordTxt() {
        passwordTxt = UITextField(frame: CGRect(x: 30, y: UIScreen.main.bounds.midY-130, width: 300, height: 50))
        passwordTxt.placeholder = "Password"
        autolayoutTxtField(a: passwordTxt)
        
        }
    private func autolayoutTxtField(a : UITextField) {
        a.textColor=#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        a.backgroundColor = UIColor.white
        a.leftViewMode = .always
        a.layer.cornerRadius = 5
        a.layer.borderWidth = 2
        a.layer.borderColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        view.addSubview(a)
        }
    private func autolayoutLoginBtn() {
        loginBtn = UIButton(frame: CGRect(x: UIScreen.main.bounds.midX-50, y: UIScreen.main.bounds.midY+270, width: 100, height: 40))
        
        loginBtn.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        loginBtn.addTarget(self, action:#selector(DidLoginBtnClick), for: .touchUpInside)
        view.addSubview(loginBtn)
        
    }
    @objc private func DidLoginBtnClick() {
        guard let username = usernameTxt.text, let password = passwordTxt.text else {
            return
            }
        if username == "" && password == "" {
            
            let home = HomeViewController()
            home.username = username
            navigationController?.pushViewController(home, animated: true)
        }
    }
    //    private func validateLogin(username: String, password: String) -> Bool {
    //            var isSuccess = true
    //            return isSuccess
    //        }

    

}
