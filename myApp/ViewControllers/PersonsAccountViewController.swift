//
//  PersonsAccountViewController.swift
//  myApp
//
//  Created by Shamil Aglarov on 20.02.2023.
//

import UIKit

class PersonsAccountViewController: UIViewController {
    
    var person = Person()
    var firsName = String()
    var surName = String()
    var dateOfBirdh = String()
    var phoneNumberOrEmail = String()
    var login = String()
    var password = String()
    var age = Int()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        navigationItem.title = person.surName
        
        print(person.fistName)
        print(person.surName)
        print(person.age)
        print(person.dateOfBirdh)
        print(person.phoneNumberOrEmail)
        print(person.login)
        print(person.password)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
