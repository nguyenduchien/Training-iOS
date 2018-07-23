//
//  ListNumbers.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/3/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class ListNumbers: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var items = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "List Numbers"
        self.collectionView.register(UINib(nibName: "NumberCell", bundle: nil), forCellWithReuseIdentifier: "reuseIdentifier")
        for index in 0...99 {
            items.append("\(index)")
        }

        collectionView.dataSource = self
        collectionView.delegate = self

    }
}
extension ListNumbers: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //DATASOURCE
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseIdentifier", for: indexPath) as? NumberCell else {
            fatalError("Invalid cell dequeue")
        }
        cell.backgroundColor = .blue
        cell.number = items[indexPath.item]
        cell.index = items[indexPath.item]
        return cell
    }    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    //DELEGATE
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 60
        return CGSize(width: width / 5, height: width / 5)
    }
    
}

