//
//  AppDelegate.swift
//  MyLearning
//
//  Created by Quang Dang N.K on 4/2/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit
import IQKeyboardManager
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        _ = TabbarVC()
        window?.rootViewController = UINavigationController(rootViewController: HomeViewController())
//        checkLogin()
//        checkLogout()
        window?.makeKeyAndVisible()
        IQKeyboardManager.shared().isEnabled = true
        return true
    }
    func checkLogin() {
        let isLogin = UserDefaults.standard.bool(forKey: "login")

        if isLogin {
            window?.rootViewController = TabbarVC()
        } else {
            window?.rootViewController = TravelVC()
        } 
    }
    func checkLogout() {
        let isLogout = UserDefaults.standard.bool(forKey: "logout")
        if isLogout {
            window?.rootViewController = TravelVC()
        } else {
            window?.rootViewController = TabbarVC()
        }
    }
}

