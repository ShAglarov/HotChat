//
//  dd.swift
//  myApp
//
//  Created by Shamil Aglarov on 26.02.2023.
//

import Foundation

enum ErrorInputDataRegistratioinViewControllerTwo: LocalizedError {
    case errorEnterFirstName
    case errorEnterSurName
    case errorEnterDateOfBirdh
    
    var errorDescription: String? {
        switch self {
        case .errorEnterFirstName:
            return "Please enter your number phone or email."
        case .errorEnterSurName:
            return "Please enter your login."
        case .errorEnterDateOfBirdh:
            return "Please enter your password."
        }
    }
}
