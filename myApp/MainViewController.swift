//
//  ViewController.swift
//  myApp
//
//  Created by Shamil Aglarov on 14.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        
        let scroll = UIScrollView()
        
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .systemBackground
        
        return scroll
    }()
    
    let contentView: UIView = {
        
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        
        return view
    }()
    
    let loginTextField: UITextField = {
        
        let login = UITextField()
        
        login.translatesAutoresizingMaskIntoConstraints = false
        login.borderStyle = .roundedRect
        login.font = .italicSystemFont(ofSize: 15)
        login.placeholder = "Enter login"
        
        return login
    }()
    
    let passwordTextField: UITextField = {
        
        let password = UITextField()
        
        password.translatesAutoresizingMaskIntoConstraints = false
        password.borderStyle = .roundedRect
        password.font = .italicSystemFont(ofSize: 15)
        password.placeholder = "Enter password"
        
        return password
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewBackGroundColor()
        setScrollView()
        setupViews()
        addLefImageTo(textField: loginTextField, image: UIImage(named: "loginBackground")!)
        addLefImageTo(textField: passwordTextField, image: UIImage(named: "passwordBackground")!)
    }
}
