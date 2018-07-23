//
//  VideoCell.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/15/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {

    @IBOutlet weak var thumbnailvideoimageView: UIImageView!
    @IBOutlet weak var titlevideoLbl: UILabel!
    @IBOutlet weak var titlechanelLbl: UILabel!
    @IBOutlet weak var publishLbl: UILabel!
    
    var video: Video? {
        didSet {
            DispatchQueue.main.async {
                self.updateUI()
            }
        }
    }
    private func updateUI() {
        titlevideoLbl.text = video?.videoTitle
        titlechanelLbl.text = video?.channelTilte
        publishLbl.text = video?.publishedAt
        let url = URL(string: (video?.thumbnail)!)
        thumbnailvideoimageView.downloadedFrom(url: url!)
    }
}
