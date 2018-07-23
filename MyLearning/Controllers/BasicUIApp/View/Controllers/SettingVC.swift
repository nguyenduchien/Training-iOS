//
//  SettingVC.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/8/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class SettingVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var viewModel = TravelViewModel()
    @IBOutlet weak var settingtableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingtableView.dataSource = self
        settingtableView.delegate = self
        settingtableView.register(UITableViewCell.self, forCellReuseIdentifier: "SettingTable")
        settingtableView.register(UINib(nibName: "SettingCell", bundle: nil), forCellReuseIdentifier: "SettingCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.menuSetting.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as? SettingCell else {
            fatalError("Invalid cell dequeue")
        }
        cell.menuSettingLbl.text = viewModel.viewModelForSetting(at: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 3 {
            UserDefaults.standard.set(true, forKey: "logout")
            if let delegate = UIApplication.shared.delegate as? AppDelegate {
                delegate.checkLogout()
            }
            navigationController?.popToRootViewController(animated: true)
        } else {
            let blankvc = BlankVC()
            navigationController?.pushViewController(blankvc, animated: false)
        }
    }
}
