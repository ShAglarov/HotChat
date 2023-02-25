//
//  PopUpOnErrorView.swift
//  myApp
//
//  Created by Shamil Aglarov on 23.02.2023.
//

import UIKit

class PopUpOnErrorView: UIView {
    
    let textError: UILabel = {
        let text = UILabel()
        text.textColor = #colorLiteral(red: 0.7152026296, green: 0.7242060304, blue: 0.7240476012, alpha: 1)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let enterButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        elementsConfigure()
        setLayoutConstraintElements()
        
        let regOneVC = RegistrationViewControllerOne()
        
        enterButton.addTarget(regOneVC.self,
                              action: #selector(regOneVC.showTextFieldAfterTouchScreen),
                              for: .touchUpInside)
        enterButton.addTarget(self,
                              action: #selector(closeView),
                              for: .touchUpInside)
        
        self.backgroundColor = UIColor(patternImage: UIImage(named: "textFieldBackground")!)
    }
    
    func elementsConfigure() {
        
        enterButton.buttonConfigure(addSubview: self,
                                    title: "Try again",
                                    cornerRadius: 5,
                                    visible: true,
                                    backGroundColor: UIColor(patternImage: UIImage(named: "buttonBackground")!),
                                    titleColor: #colorLiteral(red: 0.9435585141, green: 1, blue: 0.7481297851, alpha: 1)
        )
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .systemYellow
        
    }
    
    @objc func closeView() {
        
        self.isHidden = true
    }
    
    func setLayoutConstraintElements() {
        
        self.addSubview(textError)
        
        NSLayoutConstraint.activate([
            textError.centerXAnchor
                .constraint(
                    equalTo: self.centerXAnchor
                ),
            textError.topAnchor
                .constraint(
                    equalTo: self.topAnchor,
                    constant: 30
                ),
            enterButton.widthAnchor
                .constraint(
                    equalTo: self.widthAnchor
                ),
            enterButton.bottomAnchor
                .constraint(
                    equalTo: self.bottomAnchor,
                    constant: 0
                ),
            enterButton.heightAnchor
                .constraint(equalToConstant: 55)
        ])
    }
    
}
