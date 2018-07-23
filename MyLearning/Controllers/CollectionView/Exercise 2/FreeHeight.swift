//
//  FreeHeight.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/3/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class FreeHeight: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Free Height"
        
        let pinterestLayout = PinterestLayout()
        pinterestLayout.delegate = self
        self.collectionView?.collectionViewLayout = pinterestLayout
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.white
    }
    
    func randomNumber(MIN: Int, MAX: Int) -> Int {
        return Int(arc4random_uniform(UInt32(MAX)) + UInt32(MIN));
    }
}

//MARK: -UICollectionViewDataSource

extension FreeHeight: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 51
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = UIColor.orange
        return cell
    }
}

//MARK: -UICollectionViewDelegate

extension FreeHeight: UICollectionViewDelegate {
    
}

//MARK: -PinterestLayoutDelegate

extension FreeHeight: PinterestLayoutDelegate {
    
    //Tính toán chiều cao của từng cell
    func collectionCustomView(collectionView: UICollectionView, heightForItemAtIndexPath indexPath: NSIndexPath,
                              withWidth width: CGFloat) -> CGFloat {
        return CGFloat(randomNumber(MIN: 20, MAX: 100))
    }
    
    func collectionCustomView(collectionView: UICollectionView,
                              heightForAnnotationAtIndexPath indexPath: NSIndexPath, withWidth width: CGFloat) -> CGFloat {
        let annotationPadding = CGFloat(4)
        let annotationHeaderHeight = CGFloat(17)
        let height = annotationPadding + annotationHeaderHeight + annotationPadding
        return height
    }
}
