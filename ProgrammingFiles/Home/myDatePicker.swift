//
//  myDatePicker.swift
//  NetLet
//
//  Created by Mohammed Yusuf Mitha on 01/04/20.
//  Copyright © 2020 Mohammed Yusuf Mitha. All rights reserved.
//

import UIKit


class myDatePicker: UIView {
    
    var datePicker = UIDatePicker()
    var doneButton = UIButton()
    var cancelButton = UIButton()
    var delegate : myDatePickerDelegate?
    convenience init() {
        self.init(frame: CGRect.zero)
        //assign custom vars
        
        for each in [datePicker, doneButton, cancelButton] {
            self.addSubview(each)
            each.translatesAutoresizingMaskIntoConstraints = false
        }
        
        datePicker.locale = Locale(identifier: "localeWeb".localized())
        datePicker.datePickerMode = .dateAndTime
        datePicker.minimumDate = Date()
        datePicker.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        datePicker.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        datePicker.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: 170*iPhoneFactorX).isActive = true
        datePicker.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        datePicker.backgroundColor = .white
        doneButton.bottomAnchor.constraint(equalTo: datePicker.topAnchor).isActive = true
        doneButton.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 40*iPhoneFactorX).isActive = true
        doneButton.adjustDefaultButton(fontColor: "#FFFFFF", fontSize: 12, fontType: "2")
        doneButton.backgroundColor = "#132F53".toUIColor()
        doneButton.addTarget(self, action: #selector(doneButtonAction), for: .touchUpInside)
        doneButton.setTitle("done".localized(), for: .normal)
        
        cancelButton.bottomAnchor.constraint(equalTo: datePicker.topAnchor).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 40*iPhoneFactorX).isActive = true
        cancelButton.adjustDefaultButton(fontColor: "#FFFFFF", fontSize: 12, fontType: "2")
        cancelButton.backgroundColor = "#FF5722".toUIColor()
        cancelButton.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
        cancelButton.setTitle("cancel".localized(), for: .normal)
        
        
    }
    @objc func doneButtonAction(){
        delegate?.donePressed(withDate: datePicker.date)
    }
    @objc func cancelButtonAction(){
        delegate?.cancelPressed(withDate: datePicker.date)
    }
    
}


protocol myDatePickerDelegate {
    func donePressed(withDate : Date)
    func cancelPressed(withDate : Date)
}
