//
//  TravelViewModel.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/8/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import Foundation
class TravelViewModel {
    
    enum Specify {
        case home
        case favorite
        case history
    }
    //    var cellData = [PlaceCell.viewMode]()
    enum Field {
        case username
        case email
        case password
        case repassword
        case dateofbirth
        case gender
    }
    
    var username = ""
    var email = ""
    var password = ""
    var repassword = ""
    var dateofbirth = ""
    var gender = ""
    var genders = ["Male", "Female"]

    var places: [Place] = placesData
    
    enum RegisterResult {
        case success
        case failure(Error)
    }
    enum Validation {
        enum TypeError {
            enum ValidType {
                case empty
                case validType
                case character
            }
            case username(ValidType)
            case email(ValidType)
            case password(ValidType)
            case repassword(ValidType)
            case dateofbirth(ValidType)
            case gender(ValidType)
            
            var msg: String {
                switch self {
                case .username(let type):
                    return type == .empty ? "Empty" : "Wrong" + " username"
                case .email(let type):
                    return type == .empty ? "Empty" : "Wrong" + " email"
                case .password(let type):
                    return type == .empty ? "Empty" : "Wrong" + " password"
                case .repassword(let type):
                    return type == .empty ? "Empty" : "Wrong" + " confirm password"
                case .dateofbirth(let type):
                    return type == .empty ? "Empty" : "Wrong" + " date of birth"
                case .gender(let type):
                    return type == .empty ? "Empty" : "Wrong" + " gender"
                }
            }
        }
        case success
        case failure([TypeError])
    }
    
    func validate() -> Validation {
        var errors: [Validation.TypeError] = []
        if username.isEmpty {
            let error = Validation.TypeError.username(.empty)
            errors.append(error)
        }
        
        if email.isEmpty {
            let error = Validation.TypeError.email(.empty)
            errors.append(error)
        } else {
            if !email.isValidEmail(text: email) {
                let error = Validation.TypeError.email(.validType)
                errors.append(error)
            }
        }
        
        if password.isEmpty {
            let error = Validation.TypeError.password(.empty)
            errors.append(error)
        } else {
            if password.count < 6 {
                let error = Validation.TypeError.password(.character)
                errors.append(error)
            }
        }
        
        if repassword.isEmpty {
            let error = Validation.TypeError.repassword(.empty)
            errors.append(error)
        } else {
            if repassword != password {
                let error = Validation.TypeError.repassword(.validType)
                errors.append(error)
            }
        }
        
        if dateofbirth.isEmpty {
            let error = Validation.TypeError.dateofbirth(.empty)
            errors.append(error)
        }
        
        if gender.isEmpty {
            let error = Validation.TypeError.gender(.empty)
            errors.append(error)
        }
        
        if !errors.isEmpty {
            return .failure(errors)
        }
        return .success
    }
    
    func register(complete: (RegisterResult) -> Void) {
        //        complete(.failure(Error))
        complete(.success)
    }

    func random(min: Int, max: Int) -> Int {
        return Int(min + Int(arc4random_uniform(UInt32(max - min + 1))))
    }
    func numberOfRowsInSection(specify: Specify) -> Int {
        switch specify {
        case .home:
            return places.count
        case .favorite:
            return random(min: 1, max: places.count - 2)
        case .history:
            return random(min: 1, max: places.count - 1)
        }
    }
    
    func removeAllItems(specify: Specify) {
        //        switch specify {
        //        case .favorite:
        //
        //        case .history:
        //
        //        default: break
        //        }
    }
    func removeItemAtRow(position: Int, specify: Specify) {
        //            switch specify {
        //            case .favorite:
        //
        //            case .history:
        //
        //            default: break
        //            }
    }
    
    func numberOfRowsInComponent() -> Int {
        return genders.count
    }
    func titleForRow(row: Int) -> String {
        return genders[row]
    }
    
    func viewModelForPlaceDetail(at indexPath: IndexPath) -> DetailPlaceModel { //indexPath: IndexPath, specify: Specify)
        let place: Place = placesData[indexPath.row]
        let name = place.nameCity
        let address = place.addressCity
        let image = place.imageName
        let rate = place.rate
        let description = place.description
        let images = place.listImage
        let isFavorite = place.isFavorite
        return DetailPlaceModel(name: name, address: address, image: image, rate: rate, description: description, images: images, isFavorite: isFavorite)
    }
    func viewModelForSetting(at indexPath: IndexPath) -> String {
        let menu = menuSetting[indexPath.row]
        return menu
    }
    let menuSetting = ["Change Password", "FAQ", "About", "Logout"]
}
