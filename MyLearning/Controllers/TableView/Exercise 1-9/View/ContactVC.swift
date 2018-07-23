//
//  ContactVC.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/18/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

private struct Configuration {
    static let rowHeight: CGFloat = 80
}

class ContactVC: UIViewController {
    
    @IBOutlet weak var contactTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBAction func selectCell(_ sender: Any) {
        print("You checking indexPath from ViewController")
    }
    var viewModel = ContactViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Contacts"
        configTableView()
        configSearchBar()
        
    }
    
    func configTableView() {                //REGISTER
        contactTableView.register(UITableViewCell.self, forCellReuseIdentifier: "ContactTable")
        contactTableView.register(UINib(nibName: "ContactCell", bundle: nil), forCellReuseIdentifier: "ContactCell")
        contactTableView.dataSource = self
        contactTableView.delegate = self
    }
    
    func configSearchBar() {
        searchBar.delegate = self
    }
    func search(keyword: String) {
        viewModel.search(keyword: keyword)
        contactTableView.reloadData()
    }
}


                    ///////////////////DATA SOURCE///////////////////

extension ContactVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRow(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = contactTableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as? ContactCell else {
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
        return viewModel.indexSection
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }

}


                    /////////////////////DELEGATE//////////////////////////

extension ContactVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactDetailVC = ContactDetailVC()
        contactDetailVC.viewModel = viewModel.viewModelForContactDetail(at: indexPath)
        navigationController?.pushViewController(contactDetailVC, animated: true)
    }
}

                    ////////////////////SEACH BAR//////////////////////
extension ContactVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var currentText = ""
        if let searchBarText = searchBar.text {
            currentText = searchBarText
        }
        let keyword = (currentText as NSString).replacingCharacters(in: range, with: text)
        search(keyword: keyword)
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyWord = searchBar.text else {
            search(keyword: "")
            return
        }
        search(keyword: keyWord)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        search(keyword: "")
    }
}
