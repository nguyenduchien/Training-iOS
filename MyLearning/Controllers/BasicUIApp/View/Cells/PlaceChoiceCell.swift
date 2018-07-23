//
//  PlaceChoiceCell.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/12/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class PlaceChoiceCell: UICollectionViewCell {
    @IBOutlet weak var nameCityLbl: UILabel!
    @IBOutlet weak var placechoiceImageView: UIImageView!
    var viewModel: DetailPlaceModel? {
        didSet {
            updateView()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    private func updateView() {
        
        guard let viewModel = viewModel else { return }
        placechoiceImageView.image = viewModel.image
        nameCityLbl.text = viewModel.name
    }


}
