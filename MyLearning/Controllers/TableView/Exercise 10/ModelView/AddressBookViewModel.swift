//
//  AddressBookViewModel.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/23/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import Foundation
import ContactsUI
final class AddressBookViewModel : UIViewController, CNContactPickerDelegate {
    struct Data {
        var key = ""
        var contacts: [CNContact] = []
    }
    
    var tempContacts: [CNContact] = []
    var isSearch = false
    var datas: [Data] = []
    
    //MARK: Get data from contacts
    lazy var contacts: [CNContact] = {
        let contactStore = CNContactStore()
        let keysToFetch = [
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
            CNContactImageDataAvailableKey,
            CNContactThumbnailImageDataKey] as [Any]
        
        
        // Get all the containers
        var allContainers: [CNContainer] = []
        do {
            allContainers = try contactStore.containers(matching: nil)
        } catch {
            print("Error fetching containers")
        }
        var results: [CNContact] = []
        
        // Iterate all containers and append their contacts to our results array
        
        for container in allContainers {
            let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
            
            do {
                let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
                results.append(contentsOf: containerResults)
            } catch {
                print("Error fetching results for container")
            }
        }
        return results
    }()
    
    
    func addNames() {
        var key = ""
        var data = Data()
        contacts.sort { (construct1, construct2) -> Bool in
            construct1.familyName < construct2.familyName
        }
//        for index in 0 ..< contacts.count {
        for (index, contact) in contacts.enumerated() {
            guard let firstCharacter = contact.familyName.characters.first else {
                return
            }
            if index == 0 {
                key = "\(firstCharacter)"
                data.key = key
                data.contacts.append(contact)
            } else {
                if key != "\(firstCharacter)" {
                    datas.append(data)
                    data = Data()
                    key = "\(firstCharacter)"
                    data.key = key
                    data.contacts.append(contact)
                } else {
                    data.contacts.append(contact)
                }
            }
        }
        datas.append(data)
    }
                        // Search Array function
    func searchArray(keywork: String) {
        if keywork .isEmpty {
            isSearch = false
        } else {
            isSearch = true
            tempContacts = contacts.filter({ (construct) -> Bool in
                construct.familyName.lowercased().range(of: keywork.lowercased()) != nil ||
                    construct.givenName.lowercased().range(of: keywork.lowercased()) != nil
            })
        }
    }
    
                            ///////////////////DATA SOURCE///////////////////
    
    func numberOfRow(at section: Int) -> Int {
        if isSearch {
            return tempContacts.count
        }
        return datas[section].contacts.count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> AddressBookCellViewModel? {
        var contact: CNContact
        if isSearch {
            contact = tempContacts[indexPath.row]
        } else {
            let contacts = datas[indexPath.section].contacts
            contact = contacts[indexPath.row]
        }
        
        let username = contact.familyName + " " + contact.givenName
//        guard let imageData = contact.thumbnailImageData else { return nil }
        return AddressBookCellViewModel(username: username)
//         dataImage: imageData
    }
    
    func numberOfSections() -> Int {
        if isSearch {
            return 1
        }
        return datas.count
    }
               ///SET TITLE
    func titleForHeader(in section: Int) -> String? {
        if isSearch {
            return nil
        }
        return datas[section].key
    }
    
    func indexSection() -> [String]? {
        if isSearch {
            return nil
        }
        var strings: [String] = [String]()
        for data in datas {
            strings.append(data.key)
        }
        return strings
    }
                /////////////////////DELEGATE//////////////////////////
    
    func viewModelForAddressBookDetail(at indexPath: IndexPath) -> AddressBookDetailViewModel {
        if isSearch {
            let username = tempContacts[indexPath.row].familyName + " " + tempContacts[indexPath.row].givenName
            return AddressBookDetailViewModel(username: username)
        } else {
            let username = datas[indexPath.section].contacts[indexPath.row].familyName + " " + datas[indexPath.section].contacts[indexPath.row].givenName
            return AddressBookDetailViewModel(username: username)
        }
    }
}
