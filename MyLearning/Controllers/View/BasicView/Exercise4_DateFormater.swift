//
//  Exercise4_DateFormater.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/10/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class Exercise4_DateFormater: UIViewController {

  
    @IBOutlet weak var labelTimer: UILabel!
    override func viewDidLoad() {
        self.title = "DateFormater"
        super.viewDidLoad()
        labelTimer.textAlignment = .center
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss dd-MM-yyyy"
        labelTimer.text = formatter.string(from: date)
    }
}


