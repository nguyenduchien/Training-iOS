//
//  ContactCell.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/19/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var subnameLbl: UILabel!
    var index = ""
    
    var viewModel: ContactCellViewModel? {
        didSet {
            updateView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func updateView() {

        guard let viewModel = viewModel else { return }
//      avatarImageView.image  =
//      subnameLbl.text  = viewModel.subname
        usernameLbl.text = viewModel.username
        index = viewModel.index
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func clickMe(_ sender: UIButton) {
        print("Your position : " + index + " This is \(usernameLbl.text!)")
    }
}

