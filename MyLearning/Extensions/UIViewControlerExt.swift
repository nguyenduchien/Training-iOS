//
//  UIViewControlerExt.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/14/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//
import UIKit
extension UIViewController {
    func showAlert(message:String){
        let alert = UIAlertController(title: "Attention", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel) { (action) in
            
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
