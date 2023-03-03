//
//  ViewController.swift
//  myApp
//
//  Created by Shamil Aglarov on 14.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    var persons = [Person]()
    let scrollView = UIScrollView()
    let contentView = UIView()
    let imageVeiw = UIImageView()
    let loginTextField = UITextField()
    let passwordTextField = UITextField()
    let enterButton = UIButton()
    let registrationButton = UIButton()
    let tapGesture = UITapGestureRecognizer()
    let popUpErrorView = PopUpOnErrorView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        navigationItem.title = "CHAT"
        navigationItem.backButtonTitle = "Menu"
        navigationItem.backBarButtonItem?.tintColor = .red
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc func registration() {
        navigationController?.pushViewController(RegistrationViewControllerOne(), animated: true)
    }
    
    func inputData() throws -> Int {
        
        let checkPerson = persons.first { person in
            person.login == loginTextField.text
        }
        
        if checkPerson == nil { throw ErrorInputDataMainViewController.errorEnterLogin }
        
        guard checkPerson?.password == passwordTextField.text else { throw ErrorInputDataMainViewController.errorEnterPassword }
        
        guard let indexOfPerson = persons.firstIndex(where: { $0 === checkPerson })
        else { throw ErrorInputDataMainViewController.notPerson }
        
        return indexOfPerson
    }
    
    @objc func checkEnterLoginAndPassword() {
        
        do {
            let person = try inputData()
            
            let personAccountVC = PersonsAccountViewController()
            
            personAccountVC.person = persons[person]
            
            navigationController?.pushViewController(personAccountVC, animated: true)
            
        } catch {
            textFieldDidBeginEditing(loginTextField, passwordTextField, enterButton, hide: true)
            
            textViewDidBeginEditing(PopUpOnErrorView(), status: false)
            setPopUpErrorViewConstrains(errorText: error.localizedDescription)
        }
    }

    func scrollUp() {
        
        //проверка поворота экрана если она горизонтальная то сдвигаем scrollView немного вверх
        guard self.preferredInterfaceOrientationForPresentation.isLandscape == true else { return }
        scrollView.setContentOffset(CGPoint(x: 0, y: view.bounds.height / 4), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.delegate = self
        
        viewsConfigure()
        setScrollViewConstrains()
        elementsConfigure()
        setViewElementsConstraints()
        
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // второе, когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        registrationButton.addTarget(self, action: #selector(registration), for: .touchUpInside)
        
        enterButton.addTarget(self, action: #selector(checkEnterLoginAndPassword), for: .touchUpInside)
        
        popUpErrorView.enterButton.addTarget(self,
                              action: #selector(showTextFieldAfterTouchScreen),
                              for: .touchUpInside)
    }
}
