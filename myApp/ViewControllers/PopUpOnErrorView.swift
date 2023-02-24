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
    }
    
    func elementsConfigure() {
        
        enterButton.buttonConfigure(addSubview: self,
                                    title: "Try again",
                                    cornerRadius: 2,
                                    visible: true,
                                    backGroundColor: UIColor(patternImage: UIImage(named: "buttonBackground")!),
                                    tintColor: .black)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .systemYellow
        

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
                    constant: 10
                ),
            enterButton.widthAnchor
                .constraint(
                    equalTo: self.widthAnchor
                ),
            enterButton.bottomAnchor
                .constraint(
                    equalTo: self.bottomAnchor,
                    constant: 0
                )
        ])
    }
    
}
