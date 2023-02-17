//
//  Extension_View.swift
//  myApp
//
//  Created by Shamil Aglarov on 17.02.2023.
//

import UIKit

extension UIView {
    
    func viewConfigure(
                            /// указываем в какой view поместить self.view
                            addSubview: UIView?,
                            cornerRadius: CGFloat?,
                            visible: Bool?,
                            backGroundColor: UIColor? )
    {
        guard let subView = addSubview else { return }
        
        subView.addSubview(self)
        self.layer.cornerRadius = cornerRadius ?? 0.0
        self.translatesAutoresizingMaskIntoConstraints = !(visible ?? true)
        self.backgroundColor = backGroundColor

    }

}
