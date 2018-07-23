//
//  Item.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/16/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//
import UIKit
import Foundation
class Item {
    var thumbnail: String?
    var videoTitle: String?
    var channelTilte: String?
    var publishedAt: String?
    
    init(jsonDic: Dictionary<String, Any>) {
        DispatchQueue.main.async {
            guard let snippetJson = jsonDic["snippet"] as? Dictionary<String, Any>,
                let thumbnailJson = snippetJson["thumbnails"] as? Dictionary<String, Any>,
                let thumbnailDic = thumbnailJson["high"] as? Dictionary<String, Any>,
                let thumbnailText = thumbnailDic["url"] as? String,
                let videoString = snippetJson["title"] as? String,
                let channelString = snippetJson["channelTitle"] as? String,
                let publishString = snippetJson["publishedAt"] as? String else { return }
            self.videoTitle = videoString
            self.channelTilte = channelString
            self.publishedAt = publishString
            self.thumbnail = thumbnailText
        }
    }
}
