//
//  NetworkService.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/15/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import Foundation
import UIKit

class NetworkService
{
    typealias DownloadCompletition = (([String: AnyObject]?, Error?) -> Void)
    
    static func parseJSON(_ completion: @escaping DownloadCompletition)
    {
        if let url = URL(string: "https://itunes.apple.com/us/rss/topaudiobooks/limit=20/json") {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if error != nil {
                    completion(nil, error)
                } else {
                    do {
                        if let dict = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: AnyObject] {
                            completion(dict, nil)
                        }
                    } catch let error as NSError {
                        completion(nil, error)
                    }
                }
            }).resume()
        }
    }
}

extension UIImageView {
    
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
            }.resume()
    }
    
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}
