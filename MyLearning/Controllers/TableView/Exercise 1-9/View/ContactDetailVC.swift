//
//  ContactDetailVC.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/18/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class ContactDetailVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    
    var viewModel: ContactDetailViewModel? {
        didSet {
            updateView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        self.title = "Detail Contact"
    }

    private func updateView() {
        guard let viewModel = viewModel else { return }
        guard isViewLoaded else { return }
        nameLbl.text = viewModel.username
    }
}
