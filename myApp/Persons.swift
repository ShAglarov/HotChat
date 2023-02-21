//
//  Person.swift
//  myApp
//
//  Created by Shamil Aglarov on 21.02.2023.
//
import UIKit

class Person {
    var fistName: String
    var surName: String
    var dateOfBirdh: String
    var age: Int
    var phoneNumberOrEmail: String
    var login: String
    var password: String
    
    init(
        fistName: String,
        surName: String,
        dateOfBirdh: String,
        age: Int,
        phoneNumberOrEmail: String,
        login: String,
        password: String)
    {
        self.fistName = fistName
        self.age = age
        self.surName = surName
        self.dateOfBirdh = dateOfBirdh
        self.phoneNumberOrEmail = phoneNumberOrEmail
        self.login = login
        self.password = password
    }
    
}
