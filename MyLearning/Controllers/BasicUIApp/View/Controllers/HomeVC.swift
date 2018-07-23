//
//  HomeVC.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/11/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class HomeVC: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    var specify = TravelViewModel.Specify.home
    var viewModel = TravelViewModel()
    override func viewDidLoad() {
        configTableView()
        super.viewDidLoad()
        tableView.rowHeight = 180
        tableView.dataSource = self
        tableView.delegate = self
        configNavigationBar()
    }
    
    func configNavigationBar() {
        switch specify {
        case .history:
            title = Define.Title.history
            buttonClear()
        case .favorite:
            title = Define.Title.favorite
            buttonClear()
        default:
            title = Define.Title.home
        }
    }
    func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PlaceTable")
        tableView.register(UINib(nibName: "PlaceCell", bundle: nil), forCellReuseIdentifier: "PlaceCell")
    }
    func buttonClear() {
        let clearButton = UIBarButtonItem(title: "Delete All", style: .plain, target: self, action: #selector(clearAllItem))
        self.navigationItem.rightBarButtonItem = clearButton
    }
    @objc func clearAllItem() {
        viewModel.removeAllItems(specify: specify)
        //        tableView.reloadData()
    }
    
}
extension HomeVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(specify: specify)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell", for: indexPath) as? PlaceCell else {
            fatalError("Invalid cell dequeue")
        }
        cell.viewModel = viewModel.viewModelForPlaceDetail(at: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            viewModel.removeItemAtRow(position: indexPath.row, specify: specify)
        //            tableView.reloadData()
        default: break
        }
    }
}
extension HomeVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailvc = DetailVC()
        detailvc.viewModel = viewModel.viewModelForPlaceDetail(at: indexPath)
        self.navigationController?.pushViewController(detailvc, animated: true)
    }
}
