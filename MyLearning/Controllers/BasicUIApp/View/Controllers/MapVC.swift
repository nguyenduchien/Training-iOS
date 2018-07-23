//
//  MapVC.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/11/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController {
weak var map: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Map"
        configMapView()
        

    }
    private func configMapView() {
        let map = MKMapView(frame: UIScreen.main.bounds)
        self.map = map
        let center = CLLocationCoordinate2D(latitude: 16.0472222, longitude: 108.1716000)
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        map.region = MKCoordinateRegion(center: center, span: span)
        view.addSubview(map)
    }
}
