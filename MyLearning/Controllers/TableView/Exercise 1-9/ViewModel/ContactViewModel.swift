//
//  ContactViewModel.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/20/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import Foundation

final class ContactViewModel {
    
    struct Section {
        var title: String
        var items: [String]
        init(title: String, items: [String]) {
            self.title = title
            self.items = items
        }
    }
    
    enum Doing {
        case normal
        case search(key: String)
    }
    
    enum Contact: Int {
        case actor
        case marvel
        case dc
        case pokemon
        var title: String {                     ///GET TITLE
            switch self {
            case .actor: return "Actors - Top 11 Favorite"
            case .marvel: return "Marvel - Top 11 Most Powerful Characters"
            case .dc: return "DC Comic - Top 11 Most Powerful Characters"
            case .pokemon: return "Pokemon - Top 11 Most Powerful"
            }
        }
        private var pathString: String {        ///GET PATH FILE PLIST
            switch self {
            case .actor: return "Actor"
            case .marvel: return "Marvel"
            case .dc: return "DCComic"
            case .pokemon: return "Pokemon"
            }
        }
        var dataString: [String] {                 //GET DATA
            var arr: [String] = []
            if let path = Bundle.main.url(forResource: self.pathString, withExtension: "plist"),
                let data = NSArray(contentsOf: path) as? [String] {
                arr = data
            }
            return arr
        }
        static var data: [Section] = {
            var max = 0
            var items: [Section] = []
            while let item = Contact(rawValue: max) {
                max += 1
                items.append(Section(title: item.title, items: item.dataString))
            }
            return items
        }()
    }
    
    var contacts = Contact.data
    var indexSection = ["A", "M", "D", "P"]
    
    var type: Doing = .normal {
        didSet {
            switch type {
            case .normal: contacts = Contact.data
            case .search(let key):                  // SEARCHING -     // Search Array function
                for (index, section) in contacts.enumerated(){
                    contacts[index].items = section.items.filter { (str) -> Bool in
                        guard let _ = str.range(of: key) else { return false }
                        return true
                    }
                }
            }
        }
    }
    
    func search(keyword: String) {
        type = keyword.trimmingCharacters(in: .whitespaces).isEmpty ? .normal : .search(key: keyword)
    }
                        ///////////////////DATA SOURCE///////////////////
    
    func numberOfRow(at section: Int) -> Int {
        return contacts[section].items.count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> ContactCellViewModel {
        let section = indexPath.section
        let row = indexPath.row
        //      let subname = contacts[section].items[row]
        let username = contacts[section].items[row]
        let index = "Row: \(row)  Section :\(section)"
        
        return ContactCellViewModel(username: username, index: index)
    }
    
    func numberOfSections() -> Int {
        return contacts.count
    }

                ///SET TITLE
    func titleForHeader(in section: Int) -> String {
        return contacts[section].title
    }
    
                                /////////////////////DELEGATE//////////////////////////
    
    func viewModelForContactDetail(at indexPath: IndexPath) -> ContactDetailViewModel {
        let username = contacts[indexPath.section].items[indexPath.row]
        return ContactDetailViewModel(username: username)
    }
}
