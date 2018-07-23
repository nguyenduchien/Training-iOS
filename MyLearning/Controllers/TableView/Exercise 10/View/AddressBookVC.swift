//
//  AddressBookVC.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/23/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit
import ContactsUI

private struct Configuration {
    static let rowHeight: CGFloat = 90
}

class AddressBookVC: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var addressbookTableview: UITableView!
    var viewModel = AddressBookViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My AddressBooks"
        configTableView()
        addressbookTableview.delegate = self
        searchBar.delegate = self
        viewModel.addNames()
        configNavigationBar()
    }
    
    func configTableView() {                //REGISTER
        addressbookTableview.register(UITableViewCell.self, forCellReuseIdentifier: "AddressbookTable")
        addressbookTableview.register(UINib(nibName: "AddressBookCell", bundle: nil), forCellReuseIdentifier: "AddressBookCell")
        addressbookTableview.dataSource = self
        addressbookTableview.delegate = self
    }
    func configNavigationBar() {
        turnOffEditingMode()
    }
    @objc func turnOnEditingMode(){
        addressbookTableview.isEditing = true
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(turnOffEditingMode))
        navigationItem.rightBarButtonItem = doneButton
    }
    @objc func turnOffEditingMode(){
        addressbookTableview.isEditing = false
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(turnOnEditingMode))
        navigationItem.rightBarButtonItem = editButton
    }
    

}

                    ///////////////////DATA SOURCE///////////////////
extension AddressBookVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRow(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = addressbookTableview.dequeueReusableCell(withIdentifier: "AddressBookCell", for: indexPath) as? AddressBookCell else {
            fatalError("Invalid cell dequeue")
        }
        cell.viewModel = viewModel.viewModelForCell(at: indexPath)
        return cell
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Configuration.rowHeight
    }
    
                                ///SET TITLE
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.titleForHeader(in: section)
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return viewModel.indexSection()
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}

                /////////////////////DELEGATE//////////////////////////

extension AddressBookVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let addressBookDetailVC = AddressBookDetailVC()
        addressBookDetailVC.viewModel = viewModel.viewModelForAddressBookDetail(at: indexPath)
        self.navigationController?.pushViewController(addressBookDetailVC, animated: true)
    }
    
    
            //DEMO EDIT CELL
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        let result = indexPath.section
        switch result {
        case 0:
            return .insert
        case 1:
            return .delete
        case 2:
            return .insert
        case 3:
            return .insert
        case 4:
            return .delete
        default:
            return.none
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .none:
            return
        case .delete:
            print("Delete at row \(indexPath.row)")
        case .insert:
            print("Insert at row \(indexPath.row)")
        }
    }
}

                ////////////////////SEACH BAR//////////////////////
extension AddressBookVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = self.searchBar.text ?? ""
        let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: text)
        viewModel.searchArray(keywork: prospectiveText)
        addressbookTableview.reloadData()
        return true
    }
}
