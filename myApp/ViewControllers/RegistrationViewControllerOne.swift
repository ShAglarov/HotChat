//
//  RegistrationViewController.swift
//  myApp
//
//  Created by Shamil Aglarov on 21.02.2023.
//

import UIKit

enum ErrorInputData: Error {
    case errorEnterFirstName
    case errorEnterSurName
    case errorEnterDateOfBirdh
}

class RegistrationViewControllerOne: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let popUpViewErrorView = PopUpOnErrorView()
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
        label.text = String()
        label.font = .italicSystemFont(ofSize: 15)
        return label
    }()
    
    func inputData() throws -> (String, String, String){
        
        guard let firstName = firstNameTextField.text,
              !firstName.isEmpty else { throw ErrorInputData.errorEnterFirstName }
        
        guard let surName = surNameTextField.text,
              !surName.isEmpty else { throw ErrorInputData.errorEnterSurName }
        
        guard let birdhDay = dateOfBirdhTextField.text,
              !birdhDay.isEmpty else { throw ErrorInputData.errorEnterDateOfBirdh }
        
        return (firstName, surName, birdhDay)
    }
    
    @objc func presentToFinishedRegistrationVC() {
        
        do {
            let (firstName, surName, dateOfBirdh) = try inputData()
            
            let regTwoVC = RegistrationViewControllerTwo()
            
            regTwoVC.firsName = firstName
            regTwoVC.surName = surName
            regTwoVC.dateOfBirdh = dateOfBirdh
            regTwoVC.age = self.age
            navigationController?.pushViewController(regTwoVC, animated: true)
            
        } catch {
            
            if let checkError = error as? ErrorInputData {
                
                switch checkError {
                case .errorEnterFirstName:
                    print(error)
                case .errorEnterSurName:
                    print(error)
                case .errorEnterDateOfBirdh:
                    print(error)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        //enterButton.addTarget(self, action: #selector(presentToFinishedRegistrationVC), for: .touchUpInside)
        
          enterButton.addTarget(self, action: #selector(presentToFinishedRegistrationVC), for: .touchUpInside)

    }
    
    func scrollUp() {
        
        //проверка поворота экрана если она горизонтальная то сдвигаем scrollView немного вверх
        guard self.preferredInterfaceOrientationForPresentation.isLandscape == true else { return }
        scrollView.setContentOffset(CGPoint(x: 0, y: view.bounds.height / 4), animated: true)
    }

}

