//
//  Part3.swift
//  UIelements
//
//  Created by DCS on 18/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//


import UIKit

class Part3: UIViewController {
    
    // ToolBar
    private let toolBar:UIToolbar = {
        let toolBar = UIToolbar()
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        let gallery = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(handleGallery))
        let camera = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(handleCamera))
        toolBar.items = [cancel, gallery, camera]
        return toolBar
    }()
    
    @objc private func handleCancel() {
        print("cancel called")
        self.dismiss(animated: true)
    }
    
    @objc private func handleGallery() {
        print("gallery called")
        imagePicker.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.imagePicker, animated: true)
        }
    }
    
    @objc private func handleCamera() {
        print("camera called")
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            DispatchQueue.main.async {
                self.present(self.imagePicker, animated: true)
            }
        } else {
            let alert = UIAlertController(title: "Oops!", message: "Camera not found. Try picking an image from your gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    // TabBar
    private let tabBar:UITabBar = {
        let tabBar = UITabBar()
        let history = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        let downloads = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        tabBar.items = [history, downloads]
        return tabBar
    }()
    
    // Image View
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "b15.jpg")
        return imageView
    }()
    
    private let ImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "b12.jpg")
        return imageView
    }()
    
    private let myButton:UIButton = {
        let button = UIButton()
        button.setTitle("Swipe Right", for: .normal)
        button.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 15
        return button
    }()
    
    // UIImagePickerController
    private let imagePicker:UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        return imagePicker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Part 3"
        view.backgroundColor = .white
        
        view.addSubview(toolBar)
        view.addSubview(tabBar)
        tabBar.delegate = self
        
        view.addSubview(myImageView)
        view.addSubview(ImageView)
        imagePicker.delegate = self
        
        view.addSubview(myButton)
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "b9.jpeg")!)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let toolBarHeight:CGFloat = view.safeAreaInsets.top + 40
        toolBar.frame = CGRect(x: 0, y: 0, width: view.width, height: toolBarHeight)
        
        let tabBarHeight:CGFloat = view.safeAreaInsets.bottom + 49
        tabBar.frame = CGRect(x: 0, y: view.height - tabBarHeight, width: view.width, height: tabBarHeight)
        
        myImageView.frame = CGRect(x: 20, y: toolBar.bottom + 40, width: view.width - 40, height: 200)
        
         ImageView.frame = CGRect(x: 20, y: toolBar.bottom + 300, width: view.width - 40, height: 200)
        
        myButton.frame = CGRect(x: 20, y:view.height/2+240, width: view.width - 40, height: 30)
    }
}



extension Part3: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item.tag)
    }
}



extension Part3:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[.originalImage] as? UIImage {
            myImageView.image = selectedImage
        }
        
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    @objc func handleButtonClick() {
        print("Clicked!")
        
        let vc = part4()
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
