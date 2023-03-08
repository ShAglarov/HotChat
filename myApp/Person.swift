//
//  Person.swift
//  myApp
//
//  Created by Shamil Aglarov on 21.02.2023.
//
import UIKit
import RealmSwift

class Person: Object {
    @objc dynamic var fistName: String
    @objc dynamic var surName: String
    @objc dynamic var dateOfBirdh: String
    @objc dynamic var age: Int
    @objc dynamic var phoneNumberOrEmail: String
    @objc dynamic var login: String
    @objc dynamic var password: String
    
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
    
    override init()
    {
        self.fistName = ""
        self.age = 0
        self.surName = ""
        self.dateOfBirdh = ""
        self.phoneNumberOrEmail = ""
        self.login = ""
        self.password = ""
    }
    
}
