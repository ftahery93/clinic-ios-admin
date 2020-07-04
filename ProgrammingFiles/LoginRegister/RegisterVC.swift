//
//  RegisterVC.swift
//  PlaygroundTest
//
//  Created by Mohammed Yusuf Mitha on 29/12/19.
//  Copyright © 2019 Mohammed Yusuf Mitha. All rights reserved.
//

import UIKit
import Alamofire
import Localize_Swift
import GrowingTextView
import YPImagePicker


class RegisterVC: Base {
    
 
    var firstName = UITextField()
    var civilId = UITextField()
    var mobileNumberTF = UITextField()
    var age = UITextField()
    var adress = UITextField()
    
    var passwordTF = UITextField()
    var confirmPasswordTF = UITextField()

    
    var imageButton = UIButton()
    var speclty = UITextField()
    
    
    var comingForEditProfile = false

    var registerButt = UIButton()
    var imagesArray : YPMediaItem?
    var selectedImage : UIImage?


    
    override func viewDidLoad() {
        super.viewDidLoad()
        topBar.backgroundColor = .clear
        topBar.searchButton.isHidden = true
        topBar.topBarLogo.isHidden = true
        topBar.backButton.setBackgroundImage( isEnglishApp() ? UIImage(named: "back.png") : UIImage(named: "back.png")?.withHorizontallyFlippedOrientation(), for: .normal)
        bottomBar.isHidden = true
        for each in [imageButton, speclty, firstName, civilId, mobileNumberTF, age, adress, passwordTF, confirmPasswordTF, registerButt]{
            each.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(each)
        }
        topBar.title.adjustDefaultLabel(fontColor: "#123456", fontSize: 15, fontType: "2")
        topBar.title.text = "Register"
        topBar.title.textColor = myBlueColor

      
        
        //MARK:- imageButton
        imageButton.centerXAnchor.constraint(equalTo: self.topBar.centerXAnchor).isActive = true
        imageButton.topAnchor.constraint(equalTo: self.topBar.bottomAnchor, constant: 50*iPhoneFactorX/3).isActive = true
        imageButton.widthAnchor.constraint(equalToConstant: 200*iPhoneFactorX/3).isActive = true
        imageButton.heightAnchor.constraint(equalToConstant: 200*iPhoneFactorX/3).isActive = true
        imageButton.layer.cornerRadius = 150*iPhoneFactorX/6
        imageButton.clipsToBounds = true
        imageButton.enableDebug(color: .red)
        imageButton.addTarget(self, action: #selector(imageButtonAction), for: .touchUpInside)
        imageButton.setBackgroundImage( #imageLiteral(resourceName: "add_photo.png")  , for: .normal)
        
        //MARK:- firstName
        firstName.adjustDefaultTextField(fontColor: blackColor, fontSize: 15, fontType: "1", placeholderText: "Name", actualTextToPrint: "", imageName: "")
        firstName.leadingAnchor.constraint(equalTo: self.topBar.leadingAnchor, constant: 135*iPhoneFactorX/3).isActive = true
        firstName.topAnchor.constraint(equalTo: self.imageButton.bottomAnchor, constant: 30*iPhoneFactorX/3).isActive = true
        firstName.trailingAnchor.constraint(equalTo: self.topBar.trailingAnchor, constant: -135*iPhoneFactorX/3).isActive = true
        firstName.heightAnchor.constraint(equalToConstant: 150*iPhoneFactorX/3).isActive = true
        firstName.backgroundColor = .white
        firstName.setLeftPaddingPoints(10)
        
        
        //MARK:- civilId
        civilId.adjustDefaultTextField(fontColor: blackColor, fontSize: 15, fontType: "1", placeholderText: "Civil ID", actualTextToPrint: "", imageName: "")
        civilId.leadingAnchor.constraint(equalTo: self.topBar.leadingAnchor, constant: 135*iPhoneFactorX/3).isActive = true
        civilId.topAnchor.constraint(equalTo: self.firstName.bottomAnchor, constant: 30*iPhoneFactorX/3).isActive = true
        civilId.trailingAnchor.constraint(equalTo: self.topBar.trailingAnchor, constant: -135*iPhoneFactorX/3).isActive = true
        civilId.heightAnchor.constraint(equalToConstant: 150*iPhoneFactorX/3).isActive = true
        civilId.backgroundColor = .white
        civilId.setLeftPaddingPoints(10)
        civilId.keyboardType = .numberPad
        
        
        //MARK:- mobileNumberTF
        mobileNumberTF.adjustDefaultTextField(fontColor: blackColor, fontSize: 15, fontType: "1", placeholderText: "Mobile number", actualTextToPrint: "", imageName: "")
        mobileNumberTF.topAnchor.constraint(equalTo: self.civilId.bottomAnchor, constant: 30*iPhoneFactorX/3).isActive = true
        mobileNumberTF.leadingAnchor.constraint(equalTo: self.topBar.leadingAnchor, constant: 135*iPhoneFactorX/3).isActive = true
        mobileNumberTF.trailingAnchor.constraint(equalTo: self.topBar.trailingAnchor, constant: -135*iPhoneFactorX/3).isActive = true
        mobileNumberTF.heightAnchor.constraint(equalToConstant: 150*iPhoneFactorX/3).isActive = true
        mobileNumberTF.backgroundColor = .white
        mobileNumberTF.setLeftPaddingPoints(10)
        mobileNumberTF.keyboardType = .numberPad

        
        
        //MARK:- age
        age.adjustDefaultTextField(fontColor: blackColor, fontSize: 15, fontType: "1", placeholderText: "Age", actualTextToPrint: "", imageName: "")
        age.topAnchor.constraint(equalTo: self.mobileNumberTF.bottomAnchor, constant: 30*iPhoneFactorX/3).isActive = true
        age.leadingAnchor.constraint(equalTo: self.topBar.leadingAnchor, constant: 135*iPhoneFactorX/3).isActive = true
        age.trailingAnchor.constraint(equalTo: self.topBar.trailingAnchor, constant: -135*iPhoneFactorX/3).isActive = true
        age.heightAnchor.constraint(equalToConstant: 150*iPhoneFactorX/3).isActive = true
        age.backgroundColor = .white
        age.setLeftPaddingPoints(10)
        age.keyboardType = .numberPad

        //MARK:- adress
        adress.adjustDefaultTextField(fontColor: blackColor, fontSize: 15, fontType: "1", placeholderText: "Address", actualTextToPrint: "", imageName: "")
        adress.topAnchor.constraint(equalTo: self.age.bottomAnchor, constant: 30*iPhoneFactorX/3).isActive = true
        adress.leadingAnchor.constraint(equalTo: self.topBar.leadingAnchor, constant: 135*iPhoneFactorX/3).isActive = true
        adress.trailingAnchor.constraint(equalTo: self.topBar.trailingAnchor, constant: -135*iPhoneFactorX/3).isActive = true
        adress.heightAnchor.constraint(equalToConstant: 150*iPhoneFactorX/3).isActive = true
        adress.backgroundColor = .white
        adress.setLeftPaddingPoints(10)
        
        
        

         
        //MARK:- passwordTF
        passwordTF.adjustDefaultTextField(fontColor: blackColor, fontSize: 15, fontType: "1", placeholderText: "Password", actualTextToPrint: "", imageName: "")
        passwordTF.trailingAnchor.constraint(equalTo: firstName.trailingAnchor).isActive = true
        passwordTF.topAnchor.constraint(equalTo: self.adress.bottomAnchor, constant: 30*iPhoneFactorX/3).isActive = true
        passwordTF.leadingAnchor.constraint(equalTo: firstName.leadingAnchor).isActive = true
        passwordTF.heightAnchor.constraint(equalToConstant: 150*iPhoneFactorX/3).isActive = true
        passwordTF.backgroundColor = .white
        passwordTF.textAlignment = .left
        passwordTF.isSecureTextEntry = true
        
        
        //MARK:- speclty
        speclty.adjustDefaultTextField(fontColor: blackColor, fontSize: 15, fontType: "1", placeholderText: "Specialty", actualTextToPrint: "", imageName: "")
        speclty.topAnchor.constraint(equalTo: self.passwordTF.bottomAnchor, constant: 30*iPhoneFactorX/3).isActive = true
        speclty.leadingAnchor.constraint(equalTo: self.topBar.leadingAnchor, constant: 135*iPhoneFactorX/3).isActive = true
        speclty.trailingAnchor.constraint(equalTo: self.topBar.trailingAnchor, constant: -135*iPhoneFactorX/3).isActive = true
        speclty.heightAnchor.constraint(equalToConstant: 150*iPhoneFactorX/3).isActive = true
        speclty.backgroundColor = .white
        speclty.setLeftPaddingPoints(10)
 
        registerButt.adjustDefaultButton(fontColor: "#ffffff", fontSize: 15, fontType: "2")
        registerButt.topAnchor.constraint(equalTo: self.speclty.bottomAnchor, constant: 30*iPhoneFactorX/3).isActive = true
        registerButt.centerXAnchor.constraint(equalTo: self.topBar.centerXAnchor).isActive = true
        registerButt.heightAnchor.constraint(equalToConstant: 120*widthFactor).isActive = true
        registerButt.widthAnchor.constraint(equalToConstant: 330*widthFactor).isActive = true
        registerButt.layer.cornerRadius = 4
        registerButt.setTitle( comingForEditProfile ? "save".localized() : "Register", for: .normal)
        registerButt.backgroundColor = myBlueColor
        registerButt.setTitleColor(UIColor.white, for: .normal)
        registerButt.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
       
        
    }
    
    @objc func imageButtonAction(){
        var config = YPImagePickerConfiguration()
        config.screens = [.library, .photo]
        config.library.preselectedItems = imagesArray != nil ? [imagesArray!] : []
        config.library.maxNumberOfItems = 1
        config.showsPhotoFilters = false
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { [unowned picker] items, _ in
            self.imagesArray = nil
            for item in items {
                switch item {
                    case .photo(let photo):
                        //add data to array here and update the stackview or whatever u are using to show it.
                        self.imagesArray = item
                    
                    case .video(let video):
                        break
                    
                }
            }
            picker.dismiss(animated: true) {
                self.updateImageStack()
            }
        }
        present(picker, animated: true, completion: nil)
    }
    
    func updateImageStack(){
        switch imagesArray{
            case .photo(let photo):
                imageButton.setBackgroundImage(photo.image, for: .normal)
                self.selectedImage = photo.image
                break
            case .video(let v):
                break
            
            default: break
        }
    }
    @objc func registerAction(){
        
        if(selectedImage == nil){
            self.view.makeToast("Please select image")
            imageButton.shake()
            return
        }
        
        
        if(firstName.text?.count == 0){
            self.view.makeToast("PleaseEnterfname".localized())
            return
        }
        if(civilId.text?.count == 0){
            self.view.makeToast("Please Enter civilId")
            return
        }
        if(mobileNumberTF.text?.count == 0){
            self.view.makeToast("PleaseEnterMobileNumber".localized())
            return
        }
        if(age.text?.count == 0){
            self.view.makeToast("Please Enter age")
            return
        }
       
        if(passwordTF.text?.count == 0){
            self.view.makeToast("PleaseEnterPassword".localized())
            return
        }
        
        
       
        
        registerUserNow()
    }
    
    func convertImageToBase64String (img: UIImage) -> String {
        let imageData:NSData = img.jpegData(compressionQuality: 0.10)! as NSData //UIImagePNGRepresentation(img)
        let imgString = imageData.base64EncodedString(options: .init(rawValue: 0))
        return imgString
    }
    func registerUserNow() {
        
        if (isConnectedToInternet()) {
 
            var params : [String: Any] = [
                "file" : convertImageToBase64String(img: selectedImage!),
                "name": firstName.text ?? "",
                "civil_id": civilId.text ?? "",
                "phone_number" : mobileNumberTF.text ?? "",
                "age": "\(age.text!)",
                "address": adress.text ?? "",
                "password" : passwordTF.text ?? "",
                "speciality" : speclty.text ?? ""
            ]
            
            
            var obj001 = [String:Any]()
            obj001 = ["user" : params]
            params = ["obj001" : obj001]
            
            showLoader()
            
            API.callDictionaryAPI(webserviceFor: StringIdentifiers.make_register, webMethod: .post, parameters: params, completion: { (error:Error?, task:Any?) in
                
                dismissLoader()
                
                if let tasks = task as? responseModel{
                    
                    
                    
                    let alert = prepareAlertTopPart(titleForAlert: "done".localized(), textForAlert: tasks.message ?? "")
                    
                    let noButton = prepareAlertButtons(titleForButton: "dismiss".localized(), buttonStyle: .cancel)
                    noButton.addTarget(self, action: #selector(self.takeMeBAfReg), for: .touchUpInside)
                    alert.addAction(noButton)
                    
                    self.present(alert, animated: true, completion: nil)
                    
                }
                else {
                    if let error = error
                    {
                        print("mainErr-settings===\(error.localizedDescription)===\(UserDefaults.standard.string(forKey: "AppStatusCode")!)")
                        
                        let appStatusCode: String = UserDefaults.standard.string(forKey: "AppStatusCode")!
                        
                        print("appStatusCode==\(appStatusCode)")
                        
                    }
                }
            })
        }
        
    }

    @objc func takeMeBAfReg(){
        isloggedin = true
        self.navigationController?.popViewController(animated: true)

    }
 
}
 
