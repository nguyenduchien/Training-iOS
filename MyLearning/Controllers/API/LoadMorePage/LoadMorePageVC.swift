//
//  LoadMorePageVC.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/16/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class LoadMorePageVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var videos: [Item] = []
    var pageToken = ""
    var keyword = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "VideoLoadMoreCell", bundle: nil), forCellReuseIdentifier: "VideoLoadMoreCell")
        tableView.rowHeight = 110
        tableView.delegate = self
        tableView.dataSource = self
        ApiService.callApi(keyword: keyword, token: "") { (items, token, error) in
            DispatchQueue.main.async {
                guard let data = items, let checkToken = token else { return }
                self.videos.append(contentsOf: data)
                self.pageToken = checkToken
                self.tableView.reloadData()
            }
        }
    }
}
extension LoadMorePageVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = videos.count - 5
        if indexPath.row == lastElement {
            ApiService.callApi(keyword: keyword, token: pageToken) { (items, token, error) in
                DispatchQueue.main.async {
                    guard let data = items, let checkToken = token else { return }
                    self.videos.append(contentsOf: data)
                    self.pageToken = checkToken
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoLoadMoreCell", for: indexPath) as? VideoLoadMoreCell else {
            fatalError("Invalid cell dequeue")
        }
        cell.video = videos[indexPath.row]
        return cell
    }
}
    extension LoadMorePageVC: UISearchBarDelegate {
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            guard let textSearch = searchBar.text else { return }
            let convertString = textSearch.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
            let keyword = convertString.addingPercentEncoding(withAllowedCharacters: .whitespaces)
            guard let checkKeyword = keyword else { return }
            ApiService.callApi(keyword: checkKeyword, token: "", completion: { (items, token, error) in
                DispatchQueue.main.async {
                    guard let checkVideos = items, let checkToken = token else { return print(error as Any) }
                    self.videos = checkVideos
                    self.pageToken = checkToken
                    self.keyword = checkKeyword
                    self.tableView.reloadData()
                }
            })
            self.tableView.setContentOffset(CGPoint.zero, animated: false)
            searchBar.endEditing(true)
        }
    }
