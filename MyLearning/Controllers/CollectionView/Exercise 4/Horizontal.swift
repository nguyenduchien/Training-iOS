//
//  Horizontal.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/4/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit
import AVFoundation

class Horizontal: UIViewController {
    
    var imageList = [String]()
    let itemsPerRow = 10
    let sectionInsets = UIEdgeInsets(top: 15.0, left: 15.0, bottom: 15.0, right: 15.0)
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Horizontal"
        if let layout = self.collectionView?.collectionViewLayout as? PinterestLayoutHorizontal {
            layout.delegate = self
        }
        for index in 0...200 {
            imageList.append("\(index)")
        }
        self.collectionView.register(UINib(nibName: "MyCell", bundle: nil), forCellWithReuseIdentifier: "MyCell")
        self.collectionView.dataSource = self
    }
}

extension Horizontal: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.imageList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
        myCell.backgroundColor = UIColor.orange
        return myCell
    }
}

extension Horizontal: PrintestLayoutDelegate {
    func collectionView(collectionView: UICollectionView, weightForPhotoAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(arc4random_uniform(100) + 30)
    }
    func getNumberOfRow() -> Int {
        return self.itemsPerRow
    }
}
