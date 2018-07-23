//
//  PlaceCell.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/11/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class PlaceCell: UITableViewCell {
    
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var nameCityLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var rateLbl: UILabel!
    
    public var viewModel: DetailPlaceModel? {
        didSet {
            updateView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    private func updateView() {
        
        guard let viewModel = viewModel else { return }
        placeImageView.image = viewModel.image
        nameCityLbl.text = viewModel.name
        addressLbl.text = viewModel.address
        rateLbl.text = "Rate: " + viewModel.rate
    }
}
