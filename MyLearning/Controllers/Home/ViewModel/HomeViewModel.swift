//
//  HomeViewModel.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/23/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import Foundation
class HomeViewModel {
    enum Row: Int {
        case ex1_4
        case ex1_5
        case ex1_6
        case ex1_7
        case ex2_1
        case ex2_2
        case ex2_3
        case ex2_4
        case ex2_5
        case ex2_6
        case ex3_8
        case ex3_9
        case ex4_9
        case ex4_10
        case ex5_1
        case ex5_2
        case ex5_3
        case ex5_4
        case ex5_6
        case ex6
        case ex7_1
        case ex7_2
        case ex7_3
        case ex7_4
        case ex7_5
        case ex8_1
        case ex8_2
        case ex8_3
        case ex8_4
        case ex9_1
        case ex9_2
        case ex9_3
        case ex9_4
        case ex10_1
        case ex10_2
        case ex10_3
        case ex11_1
        case ex11_2
        case ex11_3
        
        var title: String {
            switch self {
            case .ex1_4:
                return "DateFormater"
            case .ex1_5:
                return "StopWatch 2"
            case .ex1_6:
                return "Touch In View"
            case .ex1_7:
                return "Slider"
            case .ex2_1:
                return "Avatar"
            case .ex2_2:
                return "ListUser"
            case .ex2_3:
                return "Delegate"
            case .ex2_4:
                return "Load Nibname"
            case .ex2_5:
                return "ScrollView"
            case .ex2_6:
                return "CustomSlider"
            case .ex3_8:
                return "AutoScale"
            case .ex3_9:
                return "Final"
            case .ex4_9:
                return "ContactApp"
            case .ex4_10:
                return "AddressBook"
            case .ex5_1:
                return "List Numbers"
            case .ex5_2:
                return "Free Height Cell"
            case .ex5_3:
                return "Thumbnail Image"
            case .ex5_4:
                return "Horizontal"
            case .ex5_6:
                return "Final"
            case .ex6:
                return "Travel"
            case .ex7_1:
                return "Top Apple Audio Books"
            case .ex7_3:
                return "Search Videos Youtube"
            case .ex7_4:
                return "Search Video Load More"
            default:
                return "Unknown Exercise Incomplete"
            }
        }
    }
    
    enum Section: Int {
        case basicview
        case customview
        case autolayout
        case tableview
        case collectionview
        case basicapp
        case api
        case drawing
        case mapview
        case realm
        case objectmapper
        
        var title: String {
            switch self {
            case .basicview:
                return "BasicView"
            case .customview:
                return "CustomView"
            case .autolayout:
                return "AutoLayout"
            case .tableview:
                return "TableView"
            case .collectionview:
                return "CollectionView"
            case .basicapp:
                return "Basic UI App"
            case .api:
                return "API"
            case .drawing:
                return "Drawing"
            case .mapview:
                return "MapView"
            case .realm:
                return "Realm"
            case .objectmapper:
                return "ObjectMapper"
                
            }
        }

        var items: [Row] {
            switch self {
            case .basicview: return [.ex1_4, .ex1_5, .ex1_6, .ex1_7]
            case .customview: return [.ex2_1, .ex2_2, .ex2_3, .ex2_4, .ex2_5, .ex2_6]
            case .autolayout: return [.ex3_8, .ex3_9]
            case .tableview: return [.ex4_9, .ex4_10]
            case .collectionview: return [.ex5_1, .ex5_2, .ex5_3, .ex5_4, .ex5_6]
            case .basicapp: return [.ex6]
            case .api: return [.ex7_1, .ex7_3, .ex7_4]
            case .drawing: return [.ex8_1, .ex8_2, .ex8_3, .ex8_4]
            case .mapview: return [.ex9_1, .ex9_2, .ex9_3, .ex9_4]
            case .realm: return [.ex10_1, .ex10_2, .ex10_3]
            case .objectmapper: return [.ex11_1, .ex11_2, .ex11_3]
            }
        }
        static let count: Int = {
            var max = 0
            while let _ = Section(rawValue: max) {
                max += 1
            }
            return max
        }()
    }
    var countSection = Section.count
        
    func numberOfRow(at section: Int) -> Int {
        guard let item = Section(rawValue: section) else {
            return 0
        }
        return item.items.count
        }
    func titleForHeader(in section: Int) -> String? {
        guard let item = Section(rawValue: section) else { return "" }
        return item.title
    }

    
        
//    let sections = ["BasicView", "CustomView", "AutoLayout", "TableView", "Drawing", "Basic UI App", "MapView", "API", "Realm", "ObjectMapper"]
//    let items = [["DateFormater", "StopWatch", "Touch In View", "Slider"],
//                 ["Avatar", "ListUser", "Delegate", "Load Nibname", "ScrollView", "CustomSlider"],
//                 ["AutoScale", "Final"],
//                 ["ContactApp", "AddressBook"],
//                 ["Ex01", "Ex02", "Ex03", "EX04"],
//                 ["Ex01", "Ex02", "Ex03", "EX04"],
//                 ["Ex01", "Ex02", "Ex03", "EX04"],
//                 ["Ex01", "Ex02", "Ex03", "EX04"],
//                 ["Ex01", "Ex02", "Ex03", "EX04"],
//                 ["Ex01", "Ex02", "Ex03", "EX04"]]
   
}

