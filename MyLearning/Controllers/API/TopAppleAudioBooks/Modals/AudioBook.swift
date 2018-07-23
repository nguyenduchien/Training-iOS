//
//  AudioBook.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/15/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import Foundation
import UIKit

class AudioBook {
    
    var name: String?
    var price: String?
    var imageStr: String?
    var artist: String?
    
    typealias EntryDictionary = [String: AnyObject]
    
    init(entryDict: EntryDictionary) {
        if let name = entryDict["im:name"] as? Dictionary<String, AnyObject>, let label = name["label"] as? String {
            self.name = label
        }
        
        if let price = entryDict["im:price"] as? Dictionary<String, AnyObject>, let label = price["label"] as? String {
            self.price = label
        }
        
        if let artist = entryDict["im:artist"] as? Dictionary<String, AnyObject>, let label = artist["label"] as? String {
            self.artist = label
        }
        
        if let images = entryDict["im:image"] as? [Dictionary<String, AnyObject>] {
            if let image = images.first, let label = image["label"] as? String {
                self.imageStr = label
            }
        }
    }
    
    typealias DowloadSuccess = (([AudioBook]) -> Void)?
    
    static func downloadAllBooks(_ completiton: DowloadSuccess) {
        NetworkService.parseJSON { (dict, error) in
            
            if let feed = dict?["feed"] as? Dictionary<String, AnyObject>,
                let entrys = feed["entry"] as? [Dictionary<String, AnyObject>] {
                var audioBooks: [AudioBook] = []
                for entry in entrys {
                    let book = AudioBook(entryDict: entry)
                    audioBooks.append(book)
                }
                if let downloadSuccess = completiton {
                    downloadSuccess(audioBooks)
                }
            }
        }
    }
}
