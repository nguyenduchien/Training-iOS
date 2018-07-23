//
//  Exercise7_Slider.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/10/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class Exercise7_Slider: UIViewController {

    @IBOutlet weak var bgRectangelView: UIView!
    @IBOutlet weak var rectangelView: UIView!
    
    @IBOutlet weak var percentVIew: UIView!
    @IBOutlet weak var percentLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Slider"
        
 
        rectangelView.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        rectangelView.border(width: 2, color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1) )
        
        bgRectangelView.layer.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        bgRectangelView.border(width: 2, color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))

        percentVIew.layer.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        percentVIew.border(width: 2, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        percentVIew.corner(cornerRadius: percentVIew.frame.size.height / 2)

        
        let showPercent = String(format: "%.0f" , round((100 - (percentVIew.center.y * 100 / bgRectangelView.bounds.height))))
        percentLbl.text = showPercent
        rectangelView.frame.size.height = percentVIew.center.y
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: bgRectangelView)
            if position.y > 0 && position.y < bgRectangelView.bounds.height {
                if position.x > 0 && position.x < percentVIew.bounds.width {
                    percentVIew.center = CGPoint(x: percentVIew.center.x, y: position.y)
                    let showPercent = String(format: "%.0f" , round((100 - (percentVIew.center.y * 100 / bgRectangelView.bounds.height))))
                    percentLbl.text = showPercent
                    rectangelView.frame.size.height = percentVIew.center.y
                }
            }
        }
    }
    
    
    
}
