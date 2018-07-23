//
//  AddressBookDetailVC.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/23/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class AddressBookDetailVC: UIViewController {
    @IBOutlet weak var nameLbl: UILabel!
    var viewModel: AddressBookDetailViewModel? {
        didSet {
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail AddressBook"
        updateViews()
    }
    
    private func updateViews() {
        guard let viewModel = viewModel else { return }
        guard isViewLoaded else { return }
        nameLbl.text = viewModel.username     }
}
