//
//  DetailVC.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/11/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var commenttableView: UITableView!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    private var indexItem = 0
    private var images: [UIImage] = []
    var alertController: UIAlertController?
    
    @IBAction func mapBtn(_ sender: Any) {
        navigationController?.pushViewController(MapVC(), animated: true)
    }
    

    
    
    var viewModel: DetailPlaceModel? {
        didSet {
            updateView()
        }
    }
    override func viewDidLoad() {
        title = "Detail Place"
        collectionView.register(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        commenttableView.register(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "CommentCell")
        commenttableView.dataSource = self
        super.viewDidLoad()
        let favoriteButton = UIBarButtonItem(image: #imageLiteral(resourceName: "voted"), style: .plain, target: self, action: #selector(didSelectFavorite))
        self.navigationItem.rightBarButtonItem = favoriteButton
        updateView()
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(nextBtn(_:)), userInfo: nil, repeats: true)
        
    }
    func updateView() {
        guard let viewModel = viewModel else { return }
        guard isViewLoaded else { return }
    
        addressLbl.text = viewModel.address
        rateLbl.text = "Rate: " + viewModel.rate
        descriptionLbl.text = viewModel.description
        images = viewModel.images
        title = viewModel.name
    }
    @IBAction func backBtn(_ sender: Any) {
        if indexItem <= 0 {
            indexItem = images.count
        }
        indexItem -= 1
        let indexPath = IndexPath(item: indexItem, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        if indexItem > images.count - 2 {
            indexItem = -1
        }
        indexItem += 1
        let indexPath = IndexPath(item: indexItem, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
    }
    @objc func didSelectFavorite() {
        alertController = UIAlertController(title: "Add Favorite Success", message: nil, preferredStyle: .alert)
        alertController?.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController!, animated: true) {
            print("Add Favorite Success")
        }
        
    }
    
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
extension DetailVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        cell.image = images[indexPath.row]
        return cell
    }
}
extension DetailVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: itemWidth, height: 170)
    }
}
extension DetailVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as? CommentCell else {
            return UITableViewCell()
        }
        return cell
    }
}


