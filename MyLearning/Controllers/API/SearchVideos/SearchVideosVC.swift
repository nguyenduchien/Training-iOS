//
//  SearchVideosVC.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/15/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class SearchVideosVC: UIViewController {
    @IBOutlet weak var videotableView: UITableView!
    @IBOutlet weak var videosearchBar: UISearchBar!
    fileprivate var videosArr: [Video] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search Videos Youtube"
        videosearchBar.delegate = self
        videotableView.dataSource = self
        videotableView.register(UINib(nibName: "VideoCell", bundle: nil), forCellReuseIdentifier: "VideoCell")
        videotableView.rowHeight = 100
        NetworkUtils.callApi(keyword: "TheShawshankRedemption") { (videos, error) in
            guard let data = videos else { return }
            self.videosArr.append(contentsOf: data)
            self.videotableView.reloadData()
        }
    }
    
}

extension SearchVideosVC: UITableViewDataSource, UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videosArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as? VideoCell else {
            fatalError("Invalid cell dequeue")
        }
        cell.video = videosArr[indexPath.row]
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let textSearch = searchBar.text else { return }
        let convertString = textSearch.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        let keyword = convertString.addingPercentEncoding(withAllowedCharacters: .whitespaces)
        guard let checkKeyword = keyword else { return }
        NetworkUtils.callApi(keyword: checkKeyword, completion: { (videos, error) in
            DispatchQueue.main.async {
                guard let checkVideos = videos else { return print(error as Any) }
                self.videosArr = checkVideos
                self.videotableView.reloadData()
            }
        })
        searchBar.endEditing(true)
    }
}
