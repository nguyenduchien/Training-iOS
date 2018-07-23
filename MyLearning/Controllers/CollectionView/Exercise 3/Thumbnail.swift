//
//  Thumbnail.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/3/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class Thumbnail: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    private var images: [UIImage] = [#imageLiteral(resourceName: "avatar1"),#imageLiteral(resourceName: "avatar2"),#imageLiteral(resourceName: "avatar2"),#imageLiteral(resourceName: "avatar3"),#imageLiteral(resourceName: "avatar4"),#imageLiteral(resourceName: "avatar5"),#imageLiteral(resourceName: "avatar7"),#imageLiteral(resourceName: "avatar8"),#imageLiteral(resourceName: "avatar9"),#imageLiteral(resourceName: "avatar10"),#imageLiteral(resourceName: "avatar11"),#imageLiteral(resourceName: "avatar12"),#imageLiteral(resourceName: "avatar13"),#imageLiteral(resourceName: "avatar14"),#imageLiteral(resourceName: "avatar15"),#imageLiteral(resourceName: "avatar16"),#imageLiteral(resourceName: "avatar17"),#imageLiteral(resourceName: "avatar18"),#imageLiteral(resourceName: "avatar19"),#imageLiteral(resourceName: "Sojisub"),#imageLiteral(resourceName: "tomhardy"),#imageLiteral(resourceName: "tomhardy2")]


    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Thumbnail Image"
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 70, height: 70)
//        layout.scrollDirection = .horizontal
//        layout.scrollDirection = .vertical
        collectionView.register(UINib(nibName: "ThumbnailCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .black
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
//DATASOURCE
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ThumbnailCell
            else { fatalError("Invalid cell dequeue") }
        let index = Int(arc4random_uniform(UInt32(images.count)))
        cell.thumbnail = images[index]
        return cell
    }
//DELEGATE
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ThumbnailCell else { fatalError("Invalid cell dequeue") }
        imageView.image = cell.thumbnail
    }
    
}
