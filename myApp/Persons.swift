//
//  Person.swift
//  myApp
//
//  Created by Shamil Aglarov on 21.02.2023.
//
import UIKit

class Person {
    var fistName: String
    var age: Int
    var surName: String
    var dateOfBirdh: String
    var email: String
    var phoneNumber: String
    var login: String
    var password: String
    
    init(
        fistName: String,
        age: Int,
        surName: String,
        dateOfBirdh: String,
        email: String,
        phoneNumber: String,
        login: String,
        password: String)
    {
        self.fistName = fistName
        self.age = age
        self.surName = surName
        self.dateOfBirdh = dateOfBirdh
        self.email = email
        self.phoneNumber = phoneNumber
        self.login = login
        self.password = password
    }
}
