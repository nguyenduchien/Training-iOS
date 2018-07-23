//
//  ValidateString.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/15/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import Foundation
extension String {
    func isValidEmail(text: String) -> Bool {
        let regex = "[\\w._%+-|]+@[\\w0-9.-]+\\.[A-Za-z]{2,6}"
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        return test.evaluate(with: text)
    }
    var trimmed: String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}

//class Regex {
//    let internalExpression: NSRegularExpression
//    let pattern: String
//
//    init(_ pattern: String) {
//        self.pattern = pattern
//        self.internalExpression = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
//    }
//
//    func test(input: String) -> Bool {
//        let matches = self.internalExpression.matches(in: input, options: NSRegularExpression.MatchingOptions.withTransparentBounds , range:NSMakeRange(0, input.count))
//        return matches.count > 0
//    }
//}
//
//protocol Validate {
//    func validate() -> [String:AnyObject]
//}
//
//enum Validator {
//    case email, mobilePhone, linePhone, number, upperCase, lowerCase, name, specialChar, specialName
//
//    var regex:String {
//        switch self {
//        case .email :
//            return "[\\w._%+-|]+@[\\w0-9.-]+\\.[A-Za-z]{2,6}"
//        case .mobilePhone :
//            return "^((\\+)|([0-9]))[0-9]{6,14}$"
//        case .linePhone :
//            return "^[0-9-]{6,9}$|^[0-9-]{12}$"
//        case .number :
//            return ".*[0-9]+.*"
//        case .upperCase :
//            return ".*[A-Z]+.*"
//        case .lowerCase :
//            return ".*[a-z]+.*"
//        case .name :
//            return ""
//        case .specialChar :
//            return ". [ ? = * # ! @ $ % ^ & * - 0 1 2 3 4 5 6 7 8 9 ] + ¥ , ; : ' ( ) "
//        case .specialName:
//            return "anal anus arse ass ballsack balls bastard bitch biatch bloody blowjob bollock bollok boner boob bugger bum butt buttplug clitoris cock coon crap cunt damn dick dildo dyke fag feck fellate fellatio felching fuck fudgepacker fudge packer flange Goddamn God damn hell homo jerk jizz knobend labia lmao lmfao muff nigger nigga omg penis piss poop prick pube pussy queer scrotum sex shit sh1t slut smegma spunk tit tosser turd twat vagina wank whore wtf fucking fucken noob fuk fucker"
//        }
//    }
//
//    func validate(text:String?) -> Bool {
//        let regexText = NSPredicate(format: "SELF MATCHES %@", regex)
//        return regexText.evaluate(with: text)
//    }
//}
//
//extension String {
//    func isEmail() -> Bool {
//        return Validator.email.validate(text: self)
//    }
//
//    func isContainNumber() -> Bool {
//        return Validator.number.validate(text: self)
//    }
//
//    func isPhoneNumber() -> Bool {
//        return Validator.mobilePhone.validate(text: self)
//    }
//
//    func isContainSpecialChar() -> Bool {
//        let specialchar = Validator.specialChar.regex
//        let specialCharArr = specialchar.components(separatedBy: " ")
//        for name in specialCharArr {
//            if self.contains(name) {
//                return true
//            }
//        }
//        return false
//    }
//
//    func isContainUppercase() -> Bool {
//        return Validator.upperCase.validate(text: self)
//    }
//
//    func isContainLowercase() -> Bool {
//        return Validator.lowerCase.validate(text: self)
//    }
//
//    func isContainSpecialName() -> Bool {
//        let specialName = Validator.specialName.regex
//        let specialNameArr = specialName.components(separatedBy: " ")
//        for name in specialNameArr {
//            if self.contains(name) {
//                return true
//            }
//        }
//        return false
//    }
//}
