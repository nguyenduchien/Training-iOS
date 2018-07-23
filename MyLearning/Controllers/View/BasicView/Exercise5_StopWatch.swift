//
//  Exercise5_StopWatch.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/10/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class Exercise5_StopWatch: UIViewController {

    @IBOutlet weak var nstimeLabel: UILabel!
    
    weak var timer: Timer?
    var startTime: Double = 1000
    var time: Double = 0
    var elapsed: Double = 0
    var tap: Bool = false
    var second = 0
    var minute = 0
    var hour = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "StopWatch"
        nstimeLabel.textAlignment = .center
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
        startTime = Date.timeIntervalSinceReferenceDate
        tap = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func counter() {
        
        second += 1
        if second == 60 {
            second = 0
            minute += 1
            if minute == 60 {
                minute = 0
                hour += 1
            }
        }
        
        let minuteString = String(format: "%02d", minute)
        let secondString = String(format: "%02d", second)
        let hourString = String(format: "%02d", hour)
        
        
        nstimeLabel.text = "\(hourString):\(minuteString):\(secondString)"
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (tap == true) {
            elapsed = Date().timeIntervalSinceReferenceDate - startTime
            timer?.invalidate()
            timer = nil
            tap = false
        } else {
            startTime = Date().timeIntervalSinceReferenceDate - elapsed
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
            tap = true
        }
    }
}
