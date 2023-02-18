//
//  Extension_System.swift
//  myApp
//
//  Created by Shamil Aglarov on 17.02.2023.
//

import UIKit

extension UITextField {
    
    func textFieldConfigure(
                                ImageViewNamed: String?,
                                textPlaceholder: String?,
                                textColor: UIColor?,
                                font: UIFont?,
                                addSubview: UIView?,
                                cornerRadius: CGFloat?,
                                visible: Bool?,
                                backGroundColor: UIColor? )
    
    {
        guard let subView = addSubview else { return }
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: ImageViewNamed!)
        
        leftView = imageView
        leftViewMode = .always
        self.tintColor = .lightGray
        self.placeholder = textPlaceholder
        self.backgroundColor = backGroundColor
        self.textColor = textColor
        self.font = font
        self.translatesAutoresizingMaskIntoConstraints = !(visible ?? true)
        self.layer.cornerRadius = cornerRadius ?? 0.0
        subView.addSubview(self)
    }
}
