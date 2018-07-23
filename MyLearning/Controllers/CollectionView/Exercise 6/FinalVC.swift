//
//  FinalVC.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/7/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class FinalVC: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak private var collectionView: UICollectionView!
    
    let tagSections: [String] = ["#Tag1", "#Tag2", "#Tag3", "#Tag4", "#Tag5", "#Tag6"]
    let images  = [#imageLiteral(resourceName: "avatar1"),#imageLiteral(resourceName: "avatar2"),#imageLiteral(resourceName: "avatar3"),#imageLiteral(resourceName: "avatar4"),#imageLiteral(resourceName: "avatar5"),#imageLiteral(resourceName: "avatar7"),#imageLiteral(resourceName: "avatar8"),#imageLiteral(resourceName: "avatar9"),#imageLiteral(resourceName: "avatar10"),#imageLiteral(resourceName: "avatar11"),#imageLiteral(resourceName: "avatar12"),#imageLiteral(resourceName: "avatar13"),#imageLiteral(resourceName: "avatar14"),#imageLiteral(resourceName: "avatar15"),#imageLiteral(resourceName: "avatar16"),#imageLiteral(resourceName: "avatar17"),#imageLiteral(resourceName: "avatar18"),#imageLiteral(resourceName: "avatar19"),#imageLiteral(resourceName: "Sojisub"),#imageLiteral(resourceName: "tomhardy"),#imageLiteral(resourceName: "tomhardy2")]
    //    let images: [String] = ["avatar1", "avatar2","avatar3", "avatar4","avatar5", "avatar6","avatar7", "avatar8","avatar9", "avatar10","avatar11", "avatar12","avatar13", "avatar14","avatar15", "avatar16","avatar17", "avatar18","avatar19"]
    
    private var indexItem = 0
    //    @IBOutlet weak var backBtn: UIButton!
    //    @IBOutlet weak var nextBtn: UIButton!
    @IBAction func backBtn(_ sender: UIButton) {
        
        if indexItem <= 0 {
            indexItem = images.count
        }
        indexItem -= 1
        let indexPath = IndexPath(item: indexItem, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    }
    @IBAction func nextBtn(_ sender: UIButton) {
        
        if indexItem > images.count - 2 {
            indexItem = -1
        }
        indexItem += 1
        let indexPath = IndexPath(item: indexItem, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FINAL"
        tableView.register(UINib(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: "TableCell")
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(nextBtn(_:)), userInfo: nil, repeats: true)
        //        nextBtn.addTarget(self, action: #selector(backImg), for: .touchUpInside)
        //        backBtn.addTarget(self, action: #selector(nextImg), for: .touchUpInside)
        //        Timer.scheduledTimer(timeInterval: 1.2, target: self, selector: #selector(nextImg), userInfo: nil, repeats: true)
    }
    
    //    @objc func backImg() {
    //        indexItem += 1
    //        if indexItem == images.count {
    //            indexItem = 0
    //        }
    //        let indexPath = IndexPath(item: indexItem, section: 0)
    //        collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
    //    }
    
    //    @objc func nextImg() {
    //        indexItem += 1
    //        if indexItem == images.count {
    //            indexItem = 0
    //        }
    //        let indexPath = IndexPath(item: indexItem, section: 0)
    //        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    //    }
    private var itemWidth: CGFloat = UIScreen.main.bounds.width
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft {
            itemWidth = UIScreen.main.bounds.width
        } else if UIDevice.current.orientation == UIDeviceOrientation.landscapeRight {
            itemWidth = UIScreen.main.bounds.width
        } else if UIDevice.current.orientation == UIDeviceOrientation.portrait {
            itemWidth = UIScreen.main.bounds.width
            print(itemWidth)
        } else if UIDevice.current.orientation == UIDeviceOrientation.portraitUpsideDown {
            itemWidth = UIScreen.main.bounds.width
        }
        collectionView.reloadData()
    }
}
//TalleCell
extension FinalVC: UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as? TableCell else {
            return UITableViewCell()
        }
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return tagSections.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tagSections[section]
    }
    
}
extension FinalVC: UITableViewDelegate  {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

//CollectionCell
extension FinalVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CollectionCell else {
            return UICollectionViewCell()
            }
        cell.image = images[indexPath.row]
        return cell
    }
}

extension FinalVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: itemWidth, height: 200)
    }
}




