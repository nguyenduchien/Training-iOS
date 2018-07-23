//
//  Exercise6_SliderView.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/16/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

protocol SliderViewDelegate: class {
    func sliderView(view: Exercise6_SliderView, value: String?)
}
protocol SliderDataSource: class {
    func percentDefault(in view: Exercise6_SliderView) -> Int
}

class Exercise6_SliderView: UIView {
    @IBOutlet weak var bgRectangelView: UIView!
    @IBOutlet weak var percentView: UIView!
    @IBOutlet weak var percentLbl: UILabel!
    @IBOutlet weak var rectangelView: UIView!
    
    var delegate3: SliderViewDelegate?
    weak var dataSource: SliderDataSource?
    var percentDefault: Int?
    
    
    var centerCircle: CGPoint {
        get {
            return percentView.center
        }
        set {
            percentView.center = newValue
        }
    }
    
    var percentChanged: String? {
        get {
            return percentLbl.text
        }
        set {
            percentLbl.text = newValue
        }
    }
    var rectangleHeight: CGFloat? {
        get {
            return rectangelView.frame.size.height
        }
        set {
            rectangelView.frame.size.height = newValue!
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func configView() {
        
        rectangelView.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//        rectangelView.border(width: 2, color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
        bgRectangelView.layer.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        bgRectangelView.border(width: 2, color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
        percentView.layer.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        percentView.border(width: 2, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        percentView.corner(cornerRadius: percentView.frame.size.height / 2)
        
        let showPercent = String(format: "%.0f" , round((100 - (percentView.center.y * 100 / bgRectangelView.bounds.height))))
        percentLbl.text = showPercent
        rectangelView.frame.size.height = percentView.center.y
        
        guard let value = dataSource?.percentDefault(in: self) else { return }
        changePercent(value: value)
    }
    
    func changePercent(value: Int) {

        print("Custom slider percent : \(value)")
        let pointY = value
        if pointY >= 0 && pointY <= 100 {
            percentView.center.y = CGFloat(((100 - value) * Int(bgRectangelView.bounds.height)) / 100)
            self.centerCircle = CGPoint(x: self.centerCircle.x, y: percentView.center.y)
            self.percentChanged  = String(value)
            self.rectangleHeight = percentView.center.y
        } else if pointY > 100 {
            self.centerCircle = CGPoint(x: self.centerCircle.x, y: 0)
            self.percentChanged = "100"
            self.rectangleHeight = CGFloat(0)
        }
    }
        func touchsUpdate(with position: CGPoint) {
            
        if position.y > 0 && position.y < bgRectangelView.bounds.height {
            if position.x > 0 && position.x < percentView.bounds.width {
                percentView.center = CGPoint(x: percentView.center.x, y: position.y)
                let showPercent = String(format: "%.0f" , round((100 - (percentView.center.y * 100 / bgRectangelView.bounds.height))))
                percentLbl.text = showPercent
                rectangelView.frame.size.height = percentView.center.y
                delegate3?.sliderView(view: self, value: percentLbl.text)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: bgRectangelView)
            touchsUpdate(with: position)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: bgRectangelView)
            touchsUpdate(with: position)
        }
    }
}
