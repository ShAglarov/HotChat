//
//  Extension_System.swift
//  myApp
//
//  Created by Shamil Aglarov on 17.02.2023.
//

import UIKit

extension UITextField {
    
    func textFieldConfigure(
                                leftImageViewNamed: String?,
                                textPlaceholder: String?,
                                textColor: UIColor?,
                                font: UIFont?,
                                addSubview: UIView?,
                                cornerRadius: CGFloat?,
                                visible: Bool?,
                                backGroundColor: UIColor? )
    
    {
        guard let subView = addSubview else { return }
        
        let imageView: UIImageView? = UIImageView()
        
            leftViewMode = .always
            self.tintColor = .lightGray
            self.placeholder = textPlaceholder
            self.backgroundColor = backGroundColor
            self.textColor = textColor
            self.font = font
            self.translatesAutoresizingMaskIntoConstraints = !(visible ?? true)
            self.layer.cornerRadius = cornerRadius ?? 0.0
            subView.addSubview(self)
        
        guard let leftImageViewNamed = leftImageViewNamed else { return }
        imageView?.image = UIImage(named: leftImageViewNamed)
        leftView = imageView
    }
    
    func lowercasedText() {
        self.text = self.text?.lowercased()
    }
    
    func trimmingWiteSpacesText() {
        self.text = self.text?.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
}
