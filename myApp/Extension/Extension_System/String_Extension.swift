//
//  Extension_String.swift
//  myApp
//
//  Created by Shamil Aglarov on 23.02.2023.
//

import UIKit

extension String {
    
    var isString: Bool {
        let characters = CharacterSet.capitalizedLetters

        return CharacterSet(charactersIn: self).isSubset(of: characters)
    }
}
