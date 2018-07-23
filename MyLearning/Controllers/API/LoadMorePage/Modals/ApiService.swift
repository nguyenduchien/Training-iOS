//
//  ApiService.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/16/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import Foundation
typealias DataCompletion = (_ items: [Item]?, _ token: String?, _ error: Error?) -> Void

class ApiService {
    class func callApi(keyword: String, token: String, completion: @escaping DataCompletion) {
        let path = "https://www.googleapis.com/youtube/v3/search?pageToken=\(token)&part=snippet&maxResults=25&order=relevance&q=\(keyword)&key=AIzaSyDIJ9UssMoN9IfR9KnTc4lb3B9NtHpRF-c"
        guard let url = URL(string: path) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if (error != nil) {
                completion(nil, nil, error)
            } else {
                guard let myData = data else {
                    completion(nil, nil, error)
                    return
                }
                do {
                    var result: [Item] = []
                    var token: String = ""
                    let myJson = try JSONSerialization.jsonObject(with: myData, options: .allowFragments) as AnyObject
                    guard let items = myJson["items"] as? [Any],
                        let nextToken = myJson["nextPageToken"] as? String else {
                            completion(nil, nil, error)
                            return
                    }
                    token = nextToken
                    for item in items {
                        guard let item1 = item as? Dictionary<String, Any> else { return }
                        let itemData = Item(jsonDic: item1)
                        result.append(itemData)
                    }
                    completion(result, token, nil)
                } catch let error {
                    completion(nil, nil, error)
                }
            }
            }.resume()
    }
}
