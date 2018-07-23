//
//  BookCell.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/15/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    @IBOutlet weak var bookimageView: UIImageView!
    @IBOutlet weak var nameBookLbl: UILabel!
    @IBOutlet weak var priceBookLbl: UILabel!
    @IBOutlet weak var artistLbl: UILabel!
    
    var book: AudioBook? {
        didSet {
            DispatchQueue.main.async {
                self.updateUI()
            }
        }
    }
    
    private func updateUI() {
        nameBookLbl.text = book?.name
        priceBookLbl.text = book?.price
        artistLbl.text = book?.artist
        if let string = book?.imageStr, let url = URL(string: string) {
            bookimageView.downloadedFrom(url: url)
        }
    }
}
