//
//  ProfileVC.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/11/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var dateofbirthLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    let places : [Place] = placesData
    var viewModel = TravelViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        title =  "Profile"
    collectionView.register(UINib(nibName: "PlaceChoiceCell", bundle: nil), forCellWithReuseIdentifier: "PlaceChoiceCell")
    collectionView.dataSource = self
    collectionView.delegate = self
    let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(didSelectEdit))
    self.navigationItem.rightBarButtonItem = editButton
    let settingButton = UIBarButtonItem(image: #imageLiteral(resourceName: "setting"), style: .plain, target: self, action: #selector(didSelectSetting))
    self.navigationItem.leftBarButtonItem = settingButton
    }
    
    
    @objc func didSelectEdit() {
        let editvc  = EditProfileVC()
        navigationController?.pushViewController(editvc, animated: true)
        
    }
    @objc func didSelectSetting() {
        let settingvc = SettingVC()
        navigationController?.pushViewController(settingvc, animated: true)

    }
    
}
extension ProfileVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.random(min: 4, max: 7)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaceChoiceCell", for: indexPath) as? PlaceChoiceCell else {
            fatalError("Invalid cell dequeue")
        }
        cell.viewModel = viewModel.viewModelForPlaceDetail(at: indexPath)
        return cell
    }
}
extension ProfileVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 45
        return CGSize(width: width / 3, height: width / 3)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailvc = DetailVC()
        detailvc.viewModel = viewModel.viewModelForPlaceDetail(at: indexPath)
        self.navigationController?.pushViewController(detailvc, animated: true)
    }
}

