//
//  RequestCashPopUpVC.swift
//  NetLet
//
//  Created by Mohammed Yusuf Mitha on 09/03/20.
//  Copyright © 2020 Mohammed Yusuf Mitha. All rights reserved.
//

import UIKit
import Cosmos
import TextAttributes

final class appointmentPopUpVC: UIViewController {
    
    var parentView = UIView()
    var popUpTitle = UILabel()
    var popUpMessage = UILabel()
    var requestButton = UIButton()
    var cancelButton = UIButton()
    var smallBlueLine = UIView()

    var startButton = UIButton()
    var endButton = UIButton()
    
    var appointmentObject : Appointment?
  
    var fromDate : Date?
    var toDate : Date?
    
    var datePicker = myDatePicker()

    fileprivate var currentButton : UIButton?

    var dismissButton = UIButton()
    @objc func dismissButtonAction(){
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.fillContainer()
        dismissButton.addTarget(self, action: #selector(dismissButtonAction), for: .touchUpInside)
        
        self.view.backgroundColor = UIColor(hexString: "#132F53", alpha: 0.9)
        self.view.addSubview(parentView)
        
        parentView.translatesAutoresizingMaskIntoConstraints = false
        parentView.backgroundColor = UIColor(hexString: "#F5F5F5")
        parentView.layer.cornerRadius = 4
        parentView.clipsToBounds = true
        parentView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        parentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 31*iPhoneFactorX).isActive = true
        parentView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 105*iPhoneFactorX).isActive = true
        parentView.heightAnchor.constraint(equalToConstant: 237*iPhoneFactorX).isActive = true
        
        
        self.parentView.addSubview(popUpTitle)
        popUpTitle.adjustDefaultLabel(fontColor: "#132F53", fontSize: 16, fontType: "2")
        popUpTitle.translatesAutoresizingMaskIntoConstraints = false
        popUpTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        popUpTitle.topAnchor.constraint(equalTo: self.parentView.topAnchor, constant: 22*iPhoneFactorX).isActive = true
        popUpTitle.heightAnchor.constraint(equalToConstant: 19*iPhoneFactorX).isActive = true
        popUpTitle.text = "Add Appointment"
        
        
        self.view.addSubview(smallBlueLine)
        smallBlueLine.translatesAutoresizingMaskIntoConstraints = false
        smallBlueLine.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        smallBlueLine.topAnchor.constraint(equalTo: self.popUpTitle.bottomAnchor, constant: 9*iPhoneFactorX).isActive = true
        smallBlueLine.heightAnchor.constraint(equalToConstant: 3*iPhoneFactorX).isActive = true
        smallBlueLine.widthAnchor.constraint(equalToConstant: 35*iPhoneFactorX).isActive = true
        smallBlueLine.backgroundColor = UIColor(hexString: "#132F53")
      
        self.parentView.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.topAnchor.constraint(equalTo: smallBlueLine.bottomAnchor, constant: 20*iPhoneFactorX).isActive = true
        startButton.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 20*iPhoneFactorX).isActive = true
        startButton.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -20*iPhoneFactorX).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 40*iPhoneFactorX).isActive = true
        startButton.adjustDefaultButton(fontColor: "#132F53", fontSize: 14, fontType: "2")
        startButton.enableDebug(color: .lightGray)
        startButton.setTitle("Select Start Date", for: .normal)
        startButton.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
        startButton.layer.cornerRadius = 4
        startButton.clipsToBounds = true
        
        self.parentView.addSubview(endButton)
        endButton.translatesAutoresizingMaskIntoConstraints = false
        endButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 20*iPhoneFactorX).isActive = true
        endButton.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 20*iPhoneFactorX).isActive = true
        endButton.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -20*iPhoneFactorX).isActive = true
        endButton.heightAnchor.constraint(equalToConstant: 40*iPhoneFactorX).isActive = true
        endButton.adjustDefaultButton(fontColor: "#132F53", fontSize: 14, fontType: "2")
        endButton.enableDebug(color: .lightGray)
        endButton.setTitle("Select End Date", for: .normal)
        endButton.addTarget(self, action: #selector(endButtonAction), for: .touchUpInside)
        endButton.layer.cornerRadius = 4
        endButton.clipsToBounds = true
        
        
        
        
        self.view.addSubview(requestButton)
        requestButton.adjustDefaultButton(fontColor: "#FFFFFF", fontSize: 14, fontType: "2")
        requestButton.translatesAutoresizingMaskIntoConstraints = false
        requestButton.leadingAnchor.constraint(equalTo: self.parentView.centerXAnchor, constant: 8*iPhoneFactorX).isActive = true
        requestButton.topAnchor.constraint(equalTo: self.parentView.bottomAnchor, constant: 10*iPhoneFactorX).isActive = true
        requestButton.heightAnchor.constraint(equalToConstant: 38*iPhoneFactorX).isActive = true
        requestButton.trailingAnchor.constraint(equalTo: self.parentView.trailingAnchor).isActive = true
        requestButton.backgroundColor = UIColor(hexString: "#FF5722")
        requestButton.layer.cornerRadius = 4
        requestButton.clipsToBounds = true
        requestButton.setTitle("Save", for: .normal)
        requestButton.addTarget(self, action: #selector(requestButtonAction), for: .touchUpInside)
        
        self.view.addSubview(cancelButton)
        cancelButton.adjustDefaultButton(fontColor: "#FF5722", fontSize: 14, fontType: "2")
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.trailingAnchor.constraint(equalTo: self.parentView.centerXAnchor, constant: -8*iPhoneFactorX).isActive = true
        cancelButton.topAnchor.constraint(equalTo: self.parentView.bottomAnchor, constant: 10*iPhoneFactorX).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 38*iPhoneFactorX).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: self.parentView.leadingAnchor).isActive = true
        cancelButton.backgroundColor = UIColor(hexString: "#FFFFFF")
        cancelButton.layer.cornerRadius = 4
        cancelButton.clipsToBounds = true
        cancelButton.setTitle("cancelPopUpButtonTitle".localized(), for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
        
        if(appointmentObject != nil){
            fromDate = fetchDateFromString(actualStringAsDate: appointmentObject!.start_time!, withDateFormatter: "YYYY-MM-dd HH:mm:ss")
            toDate = fetchDateFromString(actualStringAsDate: appointmentObject!.end_time!, withDateFormatter: "YYYY-MM-dd HH:mm:ss")
            
            var title =  ("Start Date : " + fromDate!.dateTimeString())
            startButton.setTitle(title, for: .normal)
            
            title =  ("End Date : " + toDate!.dateTimeString())
            endButton.setTitle(title, for: .normal)
            
 
        }
        
    }
    

    @objc func endButtonAction(){
        currentButton = endButton
        showPicker()
     }
    @objc func startButtonAction(){
        currentButton = startButton
        showPicker()
     }
 
  
    
    
    func showPicker(){
        datePicker.removeFromSuperview()
        if let topvc = UIApplication.getTopMostViewController()?.view
        {
            topvc.addSubview(datePicker)
            datePicker.translatesAutoresizingMaskIntoConstraints = false
            
            datePicker.bottomAnchor.constraint(equalTo:topvc.safeAreaLayoutGuide.bottomAnchor).isActive = true
            datePicker.leadingAnchor.constraint(equalTo:topvc.leadingAnchor).isActive = true
            datePicker.heightAnchor.constraint(equalToConstant: 210*iPhoneFactorX).isActive = true
            datePicker.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
            datePicker.delegate = self
            
        }
    }
    
    @objc func cancelButtonAction(){
        dismissButtonAction()
    }
    @objc func requestButtonAction(){
        if(fromDate == nil){
            return
        }
        if(toDate == nil){
            return
        }
        var params : [String:Any] = ["start_time": fetchDateInSpecificFormat(actualDate: fromDate!, outputFormat: "YYYY-MM-dd HH:mm:ss"),
                      "end_time":  fetchDateInSpecificFormat(actualDate: toDate!, outputFormat: "YYYY-MM-dd HH:mm:ss")]
        
        var url = StringIdentifiers.createAppointment
        
        if(appointmentObject != nil){
            var p1 : [String:Any] = ["id":"\(appointmentObject?.id ?? 0)"]
            params.merge(p1, uniquingKeysWith: {(first, _) in first })
            url = StringIdentifiers.editAppointment

        }
        
        var obj001 = [String:Any]()
        obj001 = ["appointment" : params]
        params = ["obj001" : obj001]
        
        
        
        API.callDictionaryAPI(webserviceFor: url, webMethod: .post, parameters: params) { (error, task) in
        
            if let task = task as? responseModel{
                self.dismissButtonAction()
            }
            
        }

        
    }
}

extension appointmentPopUpVC : myDatePickerDelegate{
    func donePressed(withDate: Date) {
        var title = currentButton == startButton ?  ("Start Date : " + withDate.dateTimeString()): ("End Date : " + withDate.dateTimeString())
        currentButton?.setTitle(title, for: .normal)
        
        currentButton == startButton ? (fromDate = withDate) : (toDate = withDate)
        
        datePicker.removeFromSuperview()
    }
    
    func cancelPressed(withDate: Date) {
        datePicker.removeFromSuperview()
    }
    
    
}
