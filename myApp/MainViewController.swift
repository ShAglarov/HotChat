//
//  ViewController.swift
//  myApp
//
//  Created by Shamil Aglarov on 14.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let imageVeiw = UIImageView()
    let loginTextField = UITextField()
    let passwordTextField = UITextField()
    
    func addLefImageTo(textField: UITextField, image: UIImage) {
        
        let leftImageView = UIImageView()
        
        leftImageView.image = image
        
        textField.leftView = leftImageView
        textField.leftViewMode = .always
    }
    
    func addImageInView() {
        
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewsConfigure()
        setScrollViewConstrains()
        elementsConfigure()
        setScrollViewConstrains()
        setViewsConstraints()
        
    }
}
