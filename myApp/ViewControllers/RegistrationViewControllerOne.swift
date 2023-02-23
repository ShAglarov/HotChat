//
//  RegistrationViewController.swift
//  myApp
//
//  Created by Shamil Aglarov on 21.02.2023.
//

import UIKit

class RegistrationViewControllerOne: UIViewController, UITextFieldDelegate {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let imageVeiw = UIImageView()
    let tapGesture = UITapGestureRecognizer()
    let datePicker = UIDatePicker()
    var age = String()
    
    let firstNameTextField = UITextField()
    let surNameTextField = UITextField()
    let dateOfBirdhTextField = UITextField()
    let enterButton = UIButton()

    let placeholderAgeLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        label.text = ""
        label.font = .italicSystemFont(ofSize: 15)
        return label
    }()
    
    @objc func presentToFinishedRegistrationVC() {
        if let firstName = firstNameTextField.text,
           let surName = surNameTextField.text,
           let birdhDay = dateOfBirdhTextField.text
        {
            let regTwoVC = RegistrationViewControllerTwo()
            
            regTwoVC.firsName = firstName
            regTwoVC.surName = surName
            regTwoVC.dateOfBirdh = birdhDay
            regTwoVC.age = self.age
            
            navigationController?.pushViewController(regTwoVC, animated: true)
        } else { return }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewsConfigure()
        setScrollViewConstrains()
        elementsConfigure()
        setViewElementsConstraints()
        
        enterButton.addTarget(self, action: #selector(presentToFinishedRegistrationVC), for: .touchUpInside)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // второе, когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        print(age)
    }
    
    func scrollUp() {
        
        //проверка поворота экрана если она горизонтальная то сдвигаем scrollView немного вверх
        guard self.preferredInterfaceOrientationForPresentation.isLandscape == true else { return }
        scrollView.setContentOffset(CGPoint(x: 0, y: view.bounds.height / 4), animated: true)
    }

}

