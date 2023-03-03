//
//  Error_Enum.swift
//  myApp
//
//  Created by Shamil Aglarov on 26.02.2023.
//

import Foundation

enum ErrorInputDataRegistratioinViewControllerOne: LocalizedError {
    case errorEnterFirstName
    case errorEnterSurName
    case errorEnterDateOfBirdh
    
    var errorDescription: String? {
        switch self {
        case .errorEnterFirstName:
            return "Please enter your first name."
        case .errorEnterSurName:
            return "Please enter your sur name."
        case .errorEnterDateOfBirdh:
            return "Please enter your birthday."
        }
    }
}
