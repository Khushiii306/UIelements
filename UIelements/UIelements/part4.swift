//
//  part4.swift
//  UIelements
//
//  Created by DCS on 21/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class part4: UIViewController {
    private let myButton:UIButton = {
        let button = UIButton()
        button.setTitle("Swipe Right", for: .normal)
        button.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside)
        button.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        button.layer.cornerRadius = 15
        return button
    }()
    
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "b13.jpg")
        return imageView
    }()
    
    private let myLabel:UILabel = {
        let label = UILabel()
        label.text = "Which Bird's Egg Is This?"
        label.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        label.font = label.font.withSize(20)
        label.textAlignment = .center
        return label
    }()
    
    private let mySegmentedControl:UISegmentedControl = {
        let segControl = UISegmentedControl()
        segControl.insertSegment(withTitle: "Speckled", at: 0, animated: true)
        segControl.insertSegment(withTitle: "colombian", at: 1, animated: true)
        segControl.addTarget(self, action: #selector(handleSegmentedControl), for: .valueChanged)
        segControl.selectedSegmentIndex = 0
        segControl.backgroundColor = .black
        segControl.tintColor = .white
        return segControl
    }()
    
    private let myLabel1:UILabel = {
        let label = UILabel()
        label.text = "Your Ans Rate Is!"
        label.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        label.font = label.font.withSize(20)
        label.textAlignment = .center
        return label
    }()
    
    private let mySlider:UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(handleSlider), for: .valueChanged)
        return slider
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
         view.addSubview(myButton)
        view.addSubview(myImageView)
        view.addSubview(myLabel)
        view.addSubview(mySegmentedControl)
        view.addSubview(mySlider)
        view.addSubview(myLabel1)
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "b6.jpeg")!)
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myImageView.frame = CGRect(x: 20, y:view.height/2-270, width: view.width - 40, height: 180)
        myLabel.frame = CGRect(x: 20, y: view.height/2-50, width :view.width - 40, height: 40)
        mySegmentedControl.frame = CGRect(x: 20, y: view.height/2+10, width: view.width - 40, height: 40)
        myLabel1.frame = CGRect(x: 20, y: view.height/2+140, width :view.width - 40, height: 40)
        mySlider.frame = CGRect(x: 20, y:view.height/2+190, width: view.width - 40, height: 40)
        myButton.frame = CGRect(x: 20, y:view.height/2+260, width: view.width - 40, height: 40)
    }
    
    @objc func handleButtonClick() {
        print("Clicked!")
        
        let vc = part5()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleSlider() {
        print(mySlider.value)
    }
    
    @objc func handleSegmentedControl() {
        print(mySegmentedControl.selectedSegmentIndex)
    }
   

}	
