//
//  TabbarVC.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/11/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class TabbarVC: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        _ = UITabBarController()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let homeTab = HomeVC()
            homeTab.specify = .home
        let homeTabBarItem = UITabBarItem(title: Define.Title.home, image: #imageLiteral(resourceName: "homeicon"), selectedImage: #imageLiteral(resourceName: "homeicon"))
        homeTab.tabBarItem = homeTabBarItem
        let homeNavigationTab = UINavigationController(rootViewController: homeTab)
        
        let favoriteTab = HomeVC()
            favoriteTab.specify = .favorite
        let favoriteTabBarItem = UITabBarItem(title: Define.Title.favorite, image: #imageLiteral(resourceName: "favoriteico"), selectedImage: #imageLiteral(resourceName: "favoriteico"))
        favoriteTab.tabBarItem = favoriteTabBarItem
        let favoriteNavigationTab = UINavigationController(rootViewController: favoriteTab)
        
        let mapTab  = MapVC()
        let mapTabBarItem = UITabBarItem(title: Define.Title.map, image: #imageLiteral(resourceName: "mapicon"), selectedImage: #imageLiteral(resourceName: "mapicon"))
        mapTab.tabBarItem = mapTabBarItem
        let mapNavigationTab = UINavigationController(rootViewController: mapTab)
        
        let historyTab = HomeVC()
            historyTab.specify = .history
        let historyTabBarItem = UITabBarItem(title: Define.Title.history, image: #imageLiteral(resourceName: "historyico"), selectedImage: #imageLiteral(resourceName: "historyico"))
        historyTab.tabBarItem = historyTabBarItem
        let historyNavigationTab = UINavigationController(rootViewController: historyTab)
        
        let profileTab = ProfileVC()
        let profileTabBarItem = UITabBarItem(title: Define.Title.profile, image: #imageLiteral(resourceName: "profileico"), selectedImage: #imageLiteral(resourceName: "profileico"))
        profileTab.tabBarItem = profileTabBarItem
        let profileNavigationTab = UINavigationController(rootViewController: profileTab)
        
        tabBar.tintColor = UIColor(red: 0, green: 192/255, blue: 110/255, alpha: 1)
        viewControllers = [homeNavigationTab, favoriteNavigationTab, mapNavigationTab, historyNavigationTab, profileNavigationTab]
        tabBarController?.viewControllers = viewControllers
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        item.badgeValue = nil
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
