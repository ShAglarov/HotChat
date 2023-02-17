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
    let enterButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewsConfigure()
        setScrollViewConstrains()
        elementsConfigure()
        setViewElementsConstraints()
    }
}
