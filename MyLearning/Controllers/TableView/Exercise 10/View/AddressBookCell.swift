//
//  AddressBookCell.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/23/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class AddressBookCell: UITableViewCell {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    
    var viewModel: AddressBookCellViewModel? {
        didSet {
            updateViews()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
//        initData()
    }
    
//    func initData() {
//        avatarImageView.image = #imageLiteral(resourceName: "user")
//    }
    
    private func updateViews() {
        guard let viewModel = viewModel else { return }
        usernameLbl.text = viewModel.username
//        avatarImageView.image = UIImage(data: viewModel.dataImage!)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
