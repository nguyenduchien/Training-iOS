//
//  NumberCell.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/3/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class NumberCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var index = ""
    @IBOutlet weak var numberLbl: UILabel!
    @IBAction func tapIndexBtn(_ sender: Any) {
        print("This is number: \(index)")
    }
    var number = "" {
    didSet {
    numberLbl.text = number
        }
    }
}
