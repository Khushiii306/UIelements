//
//  part5.swift
//  UIelements
//
//  Created by DCS on 21/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class part5: UIViewController {
    
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "b18.jpg")
        return imageView
    }()
    
    private let myLabel:UILabel = {
        let label = UILabel()
        label.text = "Bird's Birth Period"
        label.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        label.font = label.font.withSize(20)
        label.textAlignment = .center
        return label
    }()
    
    private let myDatePicker:UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.timeZone = TimeZone(secondsFromGMT: 0)
        datePicker.addTarget(self, action: #selector(handleDateChange), for: .valueChanged)
        datePicker.backgroundColor = .white
        return datePicker
    }()
    
    private let myLabel1:UILabel = {
        let label = UILabel()
        label.text = "Give Feedback For Small Project"
        label.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        label.font = label.font.withSize(20)
        label.textAlignment = .center
        return label
    }()
    
    private let myStepper:UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.addTarget(self, action: #selector(handleStepper), for: .valueChanged)
        stepper.backgroundColor = .white
        return stepper
    }()
    
    private let myLabel2:UILabel = {
        let label = UILabel()
        label.text = "Thank You!"
        label.backgroundColor = .white
        label.font = label.font.withSize(20)
        label.textAlignment = .center
        return label
    }()
    
    private let myLabel3:UILabel = {
        let label = UILabel()
        label.text = "Rate"
        label.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        label.font = label.font.withSize(20)
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myImageView)
        view.addSubview(myLabel)
        view.addSubview(myDatePicker)
        view.addSubview(myLabel1)
        view.addSubview(myStepper)
        view.addSubview(myLabel2)
        view.addSubview(myLabel3)
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "b9.jpeg")!)
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myImageView.frame = CGRect(x: 20, y:view.height/2-270, width: view.width - 40, height: 180)
        myLabel.frame = CGRect(x: 20, y: view.height/2-40, width :view.width - 40, height: 40)
        myDatePicker.frame = CGRect(x: 20, y:view.height/2+10, width: view.width - 40, height: 40)
        myLabel1.frame = CGRect(x: 20, y: view.height/2+110, width :view.width - 40, height: 40)
         myStepper.frame = CGRect(x: 50, y:view.height/2+160, width: view.width - 40, height: 40)
        myLabel2.frame = CGRect(x: 20, y: view.height/2+250, width :view.width - 40, height: 40)
        myLabel3.frame = CGRect(x: 200, y: view.height/2+160, width :view.width/2-80, height: 30)

    }
    
    @objc func handleDateChange() {
        print(myDatePicker.date)
    }
    
    @objc func handleStepper() {
        print(myStepper.value)
        myLabel3.text = myStepper.value.description
          }

}
