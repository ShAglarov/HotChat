//
//  Extension_NavigationController.swift
//  myApp
//
//  Created by Shamil Aglarov on 23.02.2023.
//

import UIKit

extension UINavigationController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13, *) {
            self.navigationBar.standardAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        }
        else {
            self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
            self.navigationBar.barTintColor = .white
        }
    }
}
