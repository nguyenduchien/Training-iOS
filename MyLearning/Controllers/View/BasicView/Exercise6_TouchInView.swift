//
//  Exercise6_TouchInView.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/10/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class Exercise6_TouchInView: UIViewController {
    @IBOutlet weak var pokemon: UIImageView!
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: view) else { return }
        pokemon.center = point
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        guard let point = touches.first?.location(in: view) else { return }
        pokemon.center = point
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TouchInView"
    }
}
