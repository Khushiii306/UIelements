//
//  ViewController.swift
//  UIelements
//
//  Created by DCS on 17/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let myLabel:UILabel = {
        let label = UILabel()
        label.text = "The Bird Life"
        label.font = label.font.withSize(30)
        label.textAlignment = .center
        return label
    }()
    
    
    private let myTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Write Here Bird Name! Nd Press The Icon"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        return textField
    }()
    
    private let myTextField2:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email Id"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        return textField
    }()
    
    private let myTextView:UITextView = {
        let textView = UITextView()
        textView.text = "Password"
        textView.textAlignment = .center
        textView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        return textView
    }()
    
    private let myButton:UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 6
        return button
    }()
    
    
    
    private let myPageControl:UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        //pageControl.backgroundColor = .white
        pageControl.addTarget(self, action: #selector(handlePageControl), for: .valueChanged)
        return pageControl
    }()
    
    
    
    private let mySwitch:UISwitch = {
        let switcher = UISwitch()
        switcher.addTarget(self, action: #selector(handleSwitch), for: .valueChanged)
        return switcher
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myLabel)
        view.addSubview(myTextField)
        view.addSubview(myTextField2)
        view.addSubview(myTextView)
        view.addSubview(myButton)
        view.addSubview(myPageControl)
        view.addSubview(mySwitch)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "b2.jpeg")!)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myLabel.frame = CGRect(x: 20, y: view.height/2-240, width :view.width - 40, height: 40)
        myTextField.frame = CGRect(x: 20, y:view.height/2-170, width: view.width - 40, height: 60)
        mySwitch.frame = CGRect(x:180, y: view.height/2-80, width: view.width - 60, height: 40)
         myTextField2.frame = CGRect(x: 20, y:view.height/2+20, width: view.width - 40, height: 40)
        myTextView.frame = CGRect(x: 20, y: view.height/2+80, width: view.width - 40, height: 40)
        myButton.frame = CGRect(x: 20, y:view.height/2+140, width: view.width - 40, height: 40)
        
        myPageControl.frame = CGRect(x: 20, y:view.height/2+230, width: view.width - 40, height: 40)
        
       
        
    }
    
    @objc func handleButtonClick() {
        print("Clicked!")
        
        let vc = Part2()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @objc func handlePageControl() {
        print(myPageControl.currentPage)
    }
    
    
    @objc func handleSwitch() {
        print(mySwitch.isOn)
    }
}



