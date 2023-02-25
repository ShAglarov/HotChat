//
//  Extension_UIButton.swift
//  myApp
//
//  Created by Shamil Aglarov on 18.02.2023.
//

import UIKit

extension UIButton {
    
    func buttonConfigure(
    /// указываем в какой view поместить self.button
        addSubview: UIView?,
        title: String?,
        cornerRadius: CGFloat?,
        visible: Bool?,
        backGroundColor: UIColor?,
        titleColor: UIColor?)
    {
        guard let subView = addSubview else { return }
        
        subView.addSubview(self)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = cornerRadius ?? 0.0
        self.translatesAutoresizingMaskIntoConstraints = !(visible ?? true)
        self.backgroundColor = backGroundColor
        self.setTitleColor(titleColor, for: .normal)
    }
}
