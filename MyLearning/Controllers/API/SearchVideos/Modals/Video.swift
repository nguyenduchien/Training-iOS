//
//  Video.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/15/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import Foundation
class Video {
    var thumbnail: String = ""
    var videoTitle: String = ""
    var channelTilte: String = ""
    var publishedAt: String = ""
    typealias ElementDictionary = [String: AnyObject]
    init(thumbnailDic: ElementDictionary, videoDic: ElementDictionary, channelDic: ElementDictionary, publishDic: ElementDictionary) {
        guard let checkThumbnail = thumbnailDic["url"] as? String,
            let checkvideo = videoDic["title"] as? String,
            let checkchannel = channelDic["channelTitle"] as? String,
            let checkPublish = publishDic["publishedAt"] as? String else { return }
        thumbnail = checkThumbnail
        videoTitle = checkvideo
        channelTilte = checkchannel
        publishedAt = checkPublish
    }
}
