//
//  Exercise6_CustomSlider.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/16/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class Exercise6_CustomSlider: UIViewController {
    
    @IBOutlet weak var percentTxt: UITextField!
    
    var sliderView: Exercise6_SliderView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CustomSlider"
        
        sliderView = Bundle.main.loadNibNamed("Exercise6_SliderView", owner: nil, options: nil)?.last as? Exercise6_SliderView
        sliderView?.frame = CGRect(x: 50, y: 50, width: 60, height: 300)
        sliderView?.delegate3 = self
        sliderView?.dataSource = self
        sliderView?.center = view.center
        view.addSubview(sliderView!)
        sliderView?.configView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    } 
}

extension Exercise6_CustomSlider : UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var value = 0
        if let text = textField.text,
            let textRange = Range(range, in: text) {
            var updatedText = text.replacingCharacters(in: textRange, with: string)
//            guard let inputValue = (Int(updatedText) ?? 0) else { return }
            if updatedText.isEmpty {
                updatedText = "0"
                percentTxt.text = "0"
                self.sliderView?.changePercent(value: value)
                return false
            } else {
                if let valueInt = Int(updatedText) {
                    value = valueInt > 100 ? 100 : valueInt
                    percentTxt.text = String(value)
                    self.sliderView?.changePercent(value: value)
                    return false
                }
            }
            let inputValue = Int(updatedText)
            self.sliderView?.changePercent(value: inputValue!)
        }
        textField.text = String(value)
        return true
    }
}

extension Exercise6_CustomSlider: SliderViewDelegate {
    func sliderView(view: Exercise6_SliderView, value: String?) {
        percentTxt.text = value
    }
}
extension Exercise6_CustomSlider: SliderDataSource {
    
    func percentDefault(in view: Exercise6_SliderView) -> Int {
        return 22
    }
    
}


