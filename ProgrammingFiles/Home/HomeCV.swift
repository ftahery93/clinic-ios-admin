//
//  HomeCV.swift
//  NetLet
//
//  Created by Mohammed Yusuf Mitha on 03/07/20.
//  Copyright © 2020 Mohammed Yusuf Mitha. All rights reserved.
//

import UIKit
import Stevia

class HomeCV: UITableViewCell {
    
    var issueNumberLabel = UILabel()
    
    var startDate = UILabel()
    var endDate = UILabel()
    
    var line = UIView()
    var parentView = UIView()
    var cellData: Doctor?
    
    func setUpView(_ data : Doctor?){
     cellData = data
        self.contentView.addSubview(parentView)
        parentView.translatesAutoresizingMaskIntoConstraints = false
        parentView.fillContainer(10*iPhoneFactorX)
        parentView.layer.cornerRadius = 15
        parentView.clipsToBounds = true
        parentView.backgroundColor = .white
        
        self.backgroundColor = myBackgroundColor
        var myViews = [issueNumberLabel,
                       startDate,
                       endDate,
                       line]
        
        for each in myViews{
            self.parentView.addSubview(each)
            each.translatesAutoresizingMaskIntoConstraints = false
        }
        
        issueNumberLabel.topAnchor.constraint(equalTo: self.parentView.topAnchor, constant: 0).isActive = true
        issueNumberLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        issueNumberLabel.heightAnchor.constraint(equalToConstant: 35*iPhoneFactorX).isActive = true
        issueNumberLabel.leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
        issueNumberLabel.adjustDefaultLabel(fontColor: "#FFFFFF", fontSize: 15, fontType: "2")
        issueNumberLabel.text = data?.name
        issueNumberLabel.backgroundColor = myBlueColor
        issueNumberLabel.clipsToBounds = true
        issueNumberLabel.textAlignment = .center
        
        startDate.topAnchor.constraint(equalTo: issueNumberLabel.bottomAnchor, constant: 10*iPhoneFactorX).isActive = true
        startDate.leadingAnchor.constraint(equalTo: self.parentView.leadingAnchor, constant: 10*iPhoneFactorX).isActive = true
        startDate.adjustDefaultLabel(fontColor: "#00103E", fontSize: 15, fontType: "1")
        startDate.text = data?.speciality
        
        endDate.topAnchor.constraint(equalTo: startDate.bottomAnchor, constant: 10*iPhoneFactorX).isActive = true
        endDate.leadingAnchor.constraint(equalTo: self.parentView.leadingAnchor, constant: 10*iPhoneFactorX).isActive = true
        endDate.adjustDefaultLabel(fontColor: "#00103E", fontSize: 15, fontType: "1")
        endDate.text = data?.age
        
        
        
        
        line.topAnchor.constraint(equalTo: endDate.bottomAnchor, constant: 10*iPhoneFactorX).isActive = true
        line.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        line.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1*iPhoneFactorX).isActive = true
        line.backgroundColor = .lightGray
        line.isHidden = true
        parentView.bottomAnchor.constraint(equalTo: line.bottomAnchor, constant: 10*iPhoneFactorX).isActive = true
        
        updateFields()
        
        parentView.shadowColor = .black
        parentView.shadowOffset = .init(width: 1, height: 1 )
        parentView.shadowRadius = 1
        parentView.shadowOpacity = 1
    }
    func updateFields(){ 
       
    }
}
