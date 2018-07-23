//
//  UIViewExt.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/9/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//
import UIKit
extension UIView {
    func bindToKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    @objc func keyboardWillChange(_ notification: NSNotification) {
        
        guard let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as? Double,
        let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as? UInt,
        let beginframe = notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as? NSValue,
        let endframe = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as? NSValue else { return }
        let deltaY = beginframe.cgRectValue.origin.y - endframe.cgRectValue.origin.y
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
    }
    func setborder(width:CGFloat,color:UIColor, highborder: CGFloat) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = highborder
    }
    func border(width: CGFloat, color: UIColor = .white) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    func corner(cornerRadius: CGFloat, masksToBounds: Bool = true) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
}
extension NSAttributedString {
    convenience init(text: String, aligment: NSTextAlignment, color:UIColor) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = aligment
        self.init(string: text, attributes: [NSAttributedStringKey.paragraphStyle: paragraphStyle, NSAttributedStringKey.foregroundColor:color])
    }
}
extension Date {
    var mediumDateString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}

extension UITextField {
    var string: String { return text ?? "" }
}

extension UITextView {
    var string: String { return text ?? "" }
}
