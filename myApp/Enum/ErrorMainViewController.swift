//
//  ErrorMainViewController.swift
//  myApp
//
//  Created by Shamil Aglarov on 01.03.2023.
//

import Foundation
enum ErrorInputDataMainViewController: LocalizedError {
    case errorEnterLogin
    case errorEnterPassword
    
    var errorDescription: String? {
        switch self {
        case .errorEnterLogin:
            return """
                   Incorrect Username\nThe email or number phone you
                      entered doesn't appear to belong to an account.
                      Please check your email addres or number phone
                      and try again
                   """
        case .errorEnterPassword:
            return """
                   Did you forget
                   your password?
                   We can help you log into your account
                   if you've forgotten your passrod
                   """
        }
    }
}
