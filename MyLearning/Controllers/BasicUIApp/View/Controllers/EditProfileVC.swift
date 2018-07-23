//
//  EditProfileVC.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/8/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

class EditProfileVC: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate {


    @IBOutlet weak var newusernameTxt: UITextField!
    @IBOutlet weak var newemailTxt: UITextField!
    @IBOutlet weak var newAvatarImageView: UIImageView!
    @IBOutlet weak var newGenderTxt: UITextField!
    @IBOutlet weak var newDateofbirthTxt: UITextField!
    var alertController: UIAlertController?
    var pickerController: UIImagePickerController?
    var gender = ["Male", "Female"]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit"
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didSelectDone))
        self.navigationItem.rightBarButtonItem = doneButton
        let pickerView = UIPickerView()
        newGenderTxt.inputView = pickerView
        pickerView.delegate = self
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
                return accessoryToolbar
            }
        }
        newDateofbirthTxt.inputView = datePicker
        newDateofbirthTxt.inputAccessoryView = accessoryToolbar
    }
    @objc func didSelectDone() {
        navigationController?.popViewController(animated: true)
    }


    @IBAction func changeImageSourceBtn(_ sender: Any) {
        alertController = UIAlertController(title: "Take image", message: "Choose image source", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
            self.openCamera()
        }
        let photoAction = UIAlertAction(title: "Your photos", style: .default) { (action) in
            self.openPhoto()
        }
        alertController?.addAction(cameraAction)
        alertController?.addAction(photoAction)
        alertController?.view.tintColor = UIColor.magenta
        self.present(alertController!, animated: true) {
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
        self.newAvatarImageView?.image = chosenImage
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
        return gender[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        newGenderTxt.text = gender[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gender.count
    }
    
    //COSTUM UIPickView
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label:UILabel?
        if(view == nil) {
            label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: pickerView.frame.width, height: pickerView.frame.height))
        } else {
            label = view as? UILabel
        }
        label!.text = gender[row]
        label?.textAlignment = .center
        label?.font = UIFont.boldSystemFont(ofSize: 12)
        label?.textColor = .gray
        label?.backgroundColor = .white
        return label!
    }
    
    @objc func onDateChanged(sender: UIDatePicker) {
        newDateofbirthTxt.text = sender.date.mediumDateString
    }
    @objc func onDoneButtonTapped(sender: UIBarButtonItem) {
        if newDateofbirthTxt.isFirstResponder {
            newDateofbirthTxt.resignFirstResponder()
        }
    }

}
