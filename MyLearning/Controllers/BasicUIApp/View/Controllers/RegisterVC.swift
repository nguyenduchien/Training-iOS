//
//  RegisterVC.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/9/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var registerView: UIView!
    @IBOutlet weak var effectView: UIVisualEffectView!
    @IBOutlet weak var usernameView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var repasswordView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var containBtncreateAccountView: UIView!
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var repasswordTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var genderTxt: UITextField!
    @IBOutlet weak var dateofbirthTxt: UITextField!
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var dateofbirthView: UIView!
    
    var alertController: UIAlertController?
    var pickerController: UIImagePickerController?
    var viewModel = TravelViewModel()
    let pickerView = UIPickerView()
    var datePicker: UIDatePicker {
        get {
            let datePicker = UIDatePicker()
            datePicker.date = Date()
            datePicker.datePickerMode = .date
            datePicker.addTarget(self, action: #selector(onDateChanged(sender:)), for: .valueChanged)
            datePicker.backgroundColor = UIColor.white
            return datePicker
        }
    }
    var accessoryToolbar: UIToolbar {
        get {
            let toolbarFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: 30)
            let accessoryToolbar = UIToolbar(frame: toolbarFrame)
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(onDoneButtonTapped(sender:)))
            let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            accessoryToolbar.items = [flexibleSpace, doneButton]
            accessoryToolbar.barTintColor = UIColor.white
            accessoryToolbar.sizeToFit()
            return accessoryToolbar
        }
    }
    @IBAction func chooseImageSourceBtn(_ sender: Any) {
        alertController = UIAlertController(title: "Take image", message: "Choose image source", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
            print("You choose Camera")
            self.openCamera()
        }
        let photoAction = UIAlertAction(title: "Your photos", style: .default) { (action) in
            print("You choose Photo")
            self.openPhoto()
        }
        alertController?.addAction(cameraAction)
        alertController?.addAction(photoAction)
        alertController?.view.tintColor = UIColor.magenta
        self.present(alertController!, animated: true) {
            print("presented")
        }
        
    }
    func openCamera() {
        pickerController = UIImagePickerController()
        if (UIImagePickerController.isSourceTypeAvailable(.camera) == false) {
            return
        }
        pickerController?.delegate = self
        pickerController?.allowsEditing = true
        pickerController?.sourceType = .camera
        self.present(pickerController!, animated: true) {
            print("presented Camera")
        }
    }
    func openPhoto() {
        pickerController = UIImagePickerController()
        pickerController?.delegate = self
        pickerController?.allowsEditing = true
        pickerController?.sourceType = .photoLibrary;
        self.present(pickerController!, animated: true, completion: nil)
    }
    
    
    //MARK - UINavigationControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage:UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
        self.avatarImageView?.image = chosenImage
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    //MARK - UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.titleForRow(row: row)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderTxt.text = viewModel.titleForRow(row: row)
        view.endEditing(true)
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.numberOfRowsInComponent()
    }
    
    //COSTUM UIPickView
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label:UILabel?
        if(view == nil) {
            label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: pickerView.frame.width, height: pickerView.frame.height))
        } else {
            label = view as? UILabel
        }
        label!.text = viewModel.titleForRow(row: row)
        label?.textAlignment = .center
        label?.font = UIFont.boldSystemFont(ofSize: 12)
        label?.textColor = .gray
        label?.backgroundColor = .white
        return label!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateField()
        initUI()

        
    }
    @objc func tapToBack(tap:UIGestureRecognizer){
        UIView.animate(withDuration: 0.5, animations: {
            self.effectView.alpha = 0.0
            self.view.alpha = 0
            self.view.transform  = CGAffineTransform(translationX: 0, y: 300)
        }) { (true) in
            self.view.removeFromSuperview()
            self.view.transform = .identity
        }
    }
    @objc func onDateChanged(sender: UIDatePicker) {
        dateofbirthTxt.text = sender.date.mediumDateString
    }
    @objc func onDoneButtonTapped(sender: UIBarButtonItem) {
        
        if dateofbirthTxt.isFirstResponder {
//            let formatter = DateFormatter()
//            formatter.dateFormat = "dd/MM/yyyy"
//            dateofbirthTxt.text = formatter.string(from: datePicker.date)
//            let regexDate = formatter.string(from: datePicker.date).split(separator: "/")
//            let date = Date()
//            let calendar = Calendar.current
//            let currentYear = calendar.component(.year, from: date)
//
//            if Int(regexDate[2])! > currentYear  {
//            }
            dateofbirthTxt.resignFirstResponder()
        }
    }
    private func updateField() {
        usernameTxt.text = viewModel.username
        emailTxt.text = viewModel.email
        passwordTxt.text = viewModel.password
        repasswordTxt.text = viewModel.repassword
        dateofbirthTxt.text = viewModel.dateofbirth
        genderTxt.text = viewModel.gender
    }
    private func register() {
        viewModel.username = usernameTxt.string.trimmed
        viewModel.email = emailTxt.string.trimmed
        viewModel.password = passwordTxt.string.trimmed
        viewModel.repassword = repasswordTxt.string.trimmed
        viewModel.dateofbirth = dateofbirthTxt.string.trimmed
        viewModel.gender = genderTxt.string.trimmed
        
        switch viewModel.validate() {
        case .success:
            viewModel.register { (result) in
                switch result {
                case .success:
                    navigationController?.popViewController(animated: true)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case .failure(let errors):
            for error in errors {
                switch error {
                case .username:
                    isWrong(textField: usernameTxt, message: error.msg)
                case .email:
                    isWrong(textField: emailTxt, message: error.msg)
                case .password:
                    isWrong(textField: passwordTxt, message: error.msg)
                case .repassword:
                    isWrong(textField: repasswordTxt, message: error.msg)
                case .dateofbirth:
                    isWrong(textField: dateofbirthTxt, message: error.msg)
                case .gender:
                    isWrong(textField: genderTxt, message: error.msg)
                }
            }
        }
    }
    
    private func isWrong(textField: UITextField, message: String) {
        textField.attributedPlaceholder = NSAttributedString(
            string: message, attributes: [NSAttributedStringKey.foregroundColor: UIColor.red]
        )
        textField.border(width: 1, color: .red)
        textField.corner(cornerRadius: 5)
    }

    @IBAction func createAccountBtn(_ sender: Any) {
        register()
        
    }

    func initUI(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapToBack(tap:)))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        self.effectView.addGestureRecognizer(tap)
        self.effectView.alpha = 0
        genderTxt.inputView = pickerView
        pickerView.delegate = self

        dateofbirthTxt.inputView = datePicker
        dateofbirthTxt.inputAccessoryView = accessoryToolbar
        
        registerView.corner(cornerRadius: 10)
        avatarImageView.corner(cornerRadius: (avatarImageView.bounds.height) / 2)
        containBtncreateAccountView.corner(cornerRadius: 10)
        usernameView.setborder(width: 1, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), highborder: 10)
        passwordView.setborder(width: 1, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), highborder: 10)
        repasswordView.setborder(width: 1, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), highborder: 10)
        repasswordView.setborder(width: 1, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), highborder: 10)
        emailView.setborder(width: 1, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), highborder: 10)
//        usernameTxt.attributedPlaceholder = NSAttributedString(text: "Username", aligment: .left, color:UIColor.gray)
    }
}
extension RegisterVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case usernameTxt:
            emailTxt.becomeFirstResponder()
        case emailTxt:
            passwordTxt.becomeFirstResponder()
        case passwordTxt:
            repasswordTxt.becomeFirstResponder()
        case repasswordTxt:
            dateofbirthTxt.becomeFirstResponder()
        case dateofbirthTxt:
            genderTxt.becomeFirstResponder()
            register()
        default: break
        }
        return true
    }
    
    func textField(for field: TravelViewModel.Field) -> UITextField {
        switch field {
        case .username:
            return usernameTxt
        case .email:
            return emailTxt
        case .password:
            return passwordTxt
        case .repassword:
            return repasswordTxt
        case .dateofbirth:
            return dateofbirthTxt
        case .gender:
            return genderTxt
        }
    }
}


