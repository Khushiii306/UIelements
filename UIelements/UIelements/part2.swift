//
//  Part2.swift
//  UIelements
//
//  Created by DCS on 17/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Part2: UIViewController {

    private let myButton:UIButton = {
        let button = UIButton()
        button.setTitle("Tap To Image Load", for: .normal)
        button.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        button.addTarget(self, action: #selector(handleActivity), for: .touchUpInside)
        button.layer.cornerRadius = 6
        return button
    }()
    
    @objc func handleActivity() {
        DispatchQueue.main.async {
            self.myActivityIndicatorView.isHidden = !self.myActivityIndicatorView.isHidden
            self.myActivityIndicatorView.isHidden ? self.myActivityIndicatorView.stopAnimating() : self.myActivityIndicatorView.startAnimating()
        }
    }
    
    private let myActivityIndicatorView:UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        //activity.style = .large
        activity.color = .black
        return activity
    }()
    
    // Image View
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "b1")
        return imageView
    }()
    
    private let myLabel:UILabel = {
        let label = UILabel()
        label.text = "What Is The Name Of This Bird?"
        label.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        label.font = label.font.withSize(20)
        label.textAlignment = .center
        return label
    }()
    
    private let myProgressView:UIProgressView = {
        let progressView = UIProgressView()
        progressView.setProgress(0.0, animated: true)
        return progressView
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 10.0) {
            self.myProgressView.setProgress(1.0, animated: true)
        }
    }
    
    
    // Picker View
    private let myPickerView = UIPickerView()
    private let pickerData = ["Silent Skies", "Colombian Bird", "Scarlet Tanager"]
    
    // Part 3
    private let part3Button:UIButton = {
        let button = UIButton()
        button.setTitle("Swipe Right", for: .normal)
        button.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        button.addTarget(self, action: #selector(goToPart3), for: .touchUpInside)
        button.layer.cornerRadius = 15
        return button
    }()
    
    @objc private func goToPart3()
    {
        let vc = Part3()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        nav.setNavigationBarHidden(true, animated: false)
        present(nav, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Part 2"
        view.backgroundColor = .white
        
        view.addSubview(myButton)
        view.addSubview(myActivityIndicatorView)
        view.addSubview(myImageView)
        view.addSubview(myLabel)
        view.addSubview(myProgressView)
        view.addSubview(myPickerView)
        myPickerView.dataSource = self
        myPickerView.delegate = self
        
        view.addSubview(part3Button)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "b5.jpeg")!)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myButton.frame = CGRect(x: 20, y: view.height/2-250, width: view.width - 40, height: 40)
        myActivityIndicatorView.frame = CGRect(x: 20, y:view.height/2-210, width: view.width - 40, height: 40)
        myImageView.frame = CGRect(x: 20, y:view.height/2-170, width: view.width - 40, height: 180)
        myLabel.frame = CGRect(x: 20, y:view.height/2+50, width: view.width - 40, height: 40)
        myProgressView.frame = CGRect(x: 20, y:view.height/2+120, width: view.width - 40, height: 40)
        myPickerView.frame = CGRect(x: 20, y:view.height/2+130, width: view.width - 40, height: 80)
        part3Button.frame = CGRect(x: 20, y:view.height/2+240, width: view.width - 40, height: 40)
    }
}

extension Part2: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(pickerData[row])
    }
}


