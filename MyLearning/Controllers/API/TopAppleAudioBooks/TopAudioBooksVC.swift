//
//  TopAudioBooksVC.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/15/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class TopAudioBooksVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate var books: [AudioBook] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Top Apple Audio Books"
        AudioBook.downloadAllBooks{ [weak self] (books) in
            guard let this = self else { return }
            this.books = books
        }
        tableView.register(UINib(nibName: "BookCell", bundle: nil), forCellReuseIdentifier: "BookCell")
        tableView.dataSource = self
        tableView.rowHeight = 120
    }
}

extension TopAudioBooksVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as? BookCell else {
            fatalError("Invalid cell dequeue")
        }
        cell.book = books[indexPath.row]
        return cell
    }
}
