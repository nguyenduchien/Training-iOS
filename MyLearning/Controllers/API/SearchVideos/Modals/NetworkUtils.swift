//
//  NetworkUtils.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/15/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import Foundation
typealias Completion = (_ videos: [Video]?, _ error: Error?) -> Void

class NetworkUtils {
    class func callApi(keyword: String, completion: @escaping Completion) {
        let path = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=\(keyword)&type=video&key=AIzaSyDIJ9UssMoN9IfR9KnTc4lb3B9NtHpRF-c"
        guard let url = URL(string: path) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if (error != nil) {
                completion(nil, error)
            } else {
                guard let myData = data else {
                    completion(nil, error)
                    return
                }
                do {
                    let myJson = try JSONSerialization.jsonObject(with: myData, options: .allowFragments) as AnyObject
                    guard let videos = myJson["items"] as? [Any] else { return }
                    var result: [Video] = []
                    for video in videos {
                        guard let videoJson = video as? Dictionary<String, AnyObject>,
                            let snippetJson = videoJson["snippet"] as? Dictionary<String, AnyObject>,
                            let thumbnailJson = snippetJson["thumbnails"] as? Dictionary<String, AnyObject>,
                            let thumbnailDic = thumbnailJson["high"] as? Dictionary<String, AnyObject> else {
                                completion(nil, error)
                                return
                        }
                        let video = Video(thumbnailDic: thumbnailDic, videoDic: snippetJson, channelDic: snippetJson, publishDic: snippetJson)
                        result.append(video)
                    }
                    completion(result, nil)
                } catch let error {
                    completion(nil, error)
                }
            }
            }.resume()
    }
}
