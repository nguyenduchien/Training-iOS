//
//  HomeViewController.swift
//  MyLearning
//
//  Created by Quang Dang N.K on 4/2/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
     var homeviewmodel = HomeViewModel()
    typealias Section = HomeViewModel.Section
    

    @IBOutlet weak var tableView: UITableView!
    
//    @IBOutlet weak var usernameLabel: UILabel!
//
    var username: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "HOME" ?? "\(username)"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "HomeTable")
    }
//        guard let username = username else { return }
//        usernameLabel.text = "Welcome \(username)"
}
    extension HomeViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return homeviewmodel.items[section].count
            return homeviewmodel.numberOfRow(at: section)
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return homeviewmodel.countSection
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//            return homeviewmodel.sections[section]
           return homeviewmodel.titleForHeader(in: section)
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTable", for: indexPath)
//            cell.textLabel?.text = homeviewmodel.items[indexPath.section][indexPath.row]
            if let item = Section(rawValue: indexPath.section),
                item.items.count > indexPath.row {
                cell.textLabel?.text = item.items[indexPath.row].title
            }
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
            return cell
        }
    }




extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.tableView.deselectRow(at: indexPath, animated: true)
//        if indexPath.section == 0 {
//            switch indexPath.row {
//            case 0:
//                let vc = Exercise4_DateFormater()
//                self.navigationController?.pushViewController(vc, animated: true)
//            case 1:
//                let vc = Exercise5_StopWatch()
//                self.navigationController?.pushViewController(vc, animated: true)
//            case 2:
//                let vc = Exercise6_TouchInView()
//                self.navigationController?.pushViewController(vc, animated: true)
//            case 3:
//                let vc = Exercise7_Slider()
//                self.navigationController?.pushViewController(vc, animated: true)
//            default:
//                break
//            }
//
//        }
//        if indexPath.section == 1 {
//            switch indexPath.row {
//            case 0:
//                let vc = Exercise1_Avatar()
//                self.navigationController?.pushViewController(vc, animated: true)
//            case 1:
//                let vc = Exercise2_ListUser()
//                self.navigationController?.pushViewController(vc, animated: true)
//            case 2:
//                let vc = Exercise3_Delegate()
//                self.navigationController?.pushViewController(vc, animated: true)
//            case 3:
//                let vc = Exercise4_LoadNibnameView()
//                self.navigationController?.pushViewController(vc, animated: true)
//            case 4:
//                let vc = Exercise5_ScrollView()
//                self.navigationController?.pushViewController(vc, animated: true)
//            case 5:
//                let vc = Exercise6_CustomSlider()
//                self.navigationController?.pushViewController(vc, animated: true)
//
//            default:
//                break
//            }
//        }
//        if indexPath.section == 2 {
//            switch indexPath.row {
//            case 0:
//                let vc = Exercise8_AutoScale()
//                self.navigationController?.pushViewController(vc, animated: true)
//            case 1:
//                let vc = Exercise9_Final()
//                self.navigationController?.pushViewController(vc, animated: true)
//
//            default:
//                break
//            }
//        }
//        if indexPath.section == 3 {
//            switch indexPath.row {
//            case 0:
//                let vc = ContactVC()
//                self.navigationController?.pushViewController(vc, animated: true)
//            case 1:
//                let vc = AddressBookVC()
//                self.navigationController?.pushViewController(vc, animated: true)
//            default:
//                break
//            }
//        }
        var vc: UIViewController?
        if let section = Section(rawValue: indexPath.section) {
            switch section {
            case .basicview:
                if section.items.count > indexPath.row {
                    let item = section.items[indexPath.row]
                    switch item {
                    case .ex1_4: vc = Exercise4_DateFormater()
                    case .ex1_5: vc = Exercise5_StopWatch()
                    case .ex1_6: vc = Exercise6_TouchInView()
                    case .ex1_7: vc = Exercise7_Slider()
                    default: break
                    }
                }
            case .customview:
                if section.items.count > indexPath.row {
                    let item = section.items[indexPath.row]
                    switch item {
                    case .ex2_1: vc = Exercise1_Avatar()
                    case .ex2_2: vc = Exercise2_ListUser()
                    case .ex2_3: vc = Exercise3_Delegate()
                    case .ex2_4: vc = Exercise4_LoadNibnameView()
                    case .ex2_5: vc = Exercise5_ScrollView()
                    case .ex2_6: vc = Exercise6_CustomSlider()
                    default: break
                    }
                }
            case .autolayout:
                if section.items.count > indexPath.row {
                    let item = section.items[indexPath.row]
                    switch item {
                    case .ex3_8: vc = Exercise8_AutoScale()
                    case .ex3_9: vc = Exercise9_Final()
                    default: break
                    }
                }
            case .tableview:
                if section.items.count > indexPath.row {
                    let item = section.items[indexPath.row]
                    switch item {
                    case .ex4_9: vc = ContactVC()
                    case .ex4_10: vc = AddressBookVC()
                    default: break
                    }
                }
            case .collectionview:
                if section.items.count > indexPath.row {
                    let item = section.items[indexPath.row]
                    switch item {
                    case .ex5_1: vc = ListNumbers()
                    case .ex5_2: vc = FreeHeight()
                    case .ex5_3: vc = Thumbnail()
                    case .ex5_4: vc = Horizontal()
                    case .ex5_6: vc = FinalVC()
                    default: break
                    }
                }
            case .basicapp:
                if section.items.count > indexPath.row {
                    let item = section.items[indexPath.row]
                    switch item {
                    case .ex6: vc = TravelVC()
                    default: break
                    }
                }
            case .api:
                if section.items.count > indexPath.row {
                    let item = section.items[indexPath.row]
                    switch item {
                    case .ex7_1: vc = TopAudioBooksVC()
                    case .ex7_3: vc = SearchVideosVC()
                    case .ex7_4: vc = LoadMorePageVC()
                    default: break
                    }
                }
//            case .drawing:
//                if section.items.count > indexPath.row {
//                    let item = section.items[indexPath.row]
//                    switch item {
//                    case .ex8_1: vc = Exercise1_Avatar()
//
//                    default: break
//                    }
//                }
//            case .mapview:
//                if section.items.count > indexPath.row {
//                    let item = section.items[indexPath.row]
//                    switch item {
//                    case .ex9_1: vc = Exercise1_Avatar()
//
//                    default: break
//                    }
//                }
//            case .realm:
//                if section.items.count > indexPath.row {
//                    let item = section.items[indexPath.row]
//                    switch item {
//                    case .ex10_1: vc = Exercise1_Avatar()
//
//                    default: break
//                    }
//                }
//            case .objectmapper:
//                if section.items.count > indexPath.row {
//                    let item = section.items[indexPath.row]
//                    switch item {
//                    case .ex11_1: vc = Exercise1_Avatar()
//
//                    default: break
//                    }
//                }
            default: break
            
            }
        }
        
        guard let pushVC = vc else { return }
        navigationController?.pushViewController(pushVC, animated: true)
    }
}



//    let log = UIBarButtonItem(title: "Log Out", style: UIBarButtonItemStyle.plain, target: self, action: #selector(logout))
//    
//    @objc func logout() {
//        navigationController?.popViewController(animated: true)
//    }
//    @IBAction func logoutBnt(_ sender: Any) {
//        self.navigationController?.popViewController(animated: true)
//    }
    

