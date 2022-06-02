//
//  RegisterViewController.swift
//  MobilliumCase-Programmatic
//
//  Created by Emir Alkal on 2.06.2022.
//

import UIKit

class RegisterViewController: UIViewController {
    // Buttons
    let registerButton          = MobilliumButton(title: "Register")
    
    // Text Fields
    let reTypePassTextField     = MobilliumTextField(placeholder: "Password Again")
    let passTextField           = MobilliumTextField(placeholder: "Password")
    let emailTextField          = MobilliumTextField(placeholder: "Email")
    let nameTextField           = MobilliumTextField(placeholder: "Name")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func keyboardWillAppear(_ notification: Notification) {
       
//        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//            let keyboardRectangle = keyboardFrame.cgRectValue
//            let keyboardHeight = keyboardRectangle.height
//
//            //registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -keyboardHeight - 60).isActive = true
//        }
    }

    @objc func keyboardWillDisappear() {
        
    }
    
    func configure() {
        view.backgroundColor = UIColor(named: Colors.backgroundColor.rawValue)
        
        configureRegisterButton()
        configureTextFields()
        
        reTypePassTextField.delegate = self
        passTextField.delegate = self
        emailTextField.delegate = self
        nameTextField.delegate = self
    }
    
    func configureTextFields() {
        view.addSubview(reTypePassTextField)
        
        NSLayoutConstraint.activate([
            reTypePassTextField.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -80),
            reTypePassTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            reTypePassTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            reTypePassTextField.heightAnchor.constraint(equalToConstant: 50)
        ])

        reTypePassTextField.isSecureTextEntry = true
        
        view.addSubview(passTextField)
        
        NSLayoutConstraint.activate([
            passTextField.bottomAnchor.constraint(equalTo: reTypePassTextField.topAnchor, constant: -10),
            passTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            passTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        passTextField.isSecureTextEntry = true
        
        view.addSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            emailTextField.bottomAnchor.constraint(equalTo: passTextField.topAnchor, constant: -10),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            emailTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(nameTextField)
        
        NSLayoutConstraint.activate([
            nameTextField.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -10),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            nameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureRegisterButton() {
        view.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            registerButton.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        registerButton.addTarget(nil, action: #selector(registerButtonPressed), for: .touchUpInside)
    }
    
    @objc func registerButtonPressed() {
        
        if (!isTextFieldsFilled()) {
            presentAlert(title: "Error", message: "Please enter all information.")
            return
        } else if (!isPasswdValid()) {
            presentAlert(title: "Error", message: "Passwors must be longer than 3 digits.")
            return
        } else if (!isPasswdMatches()) {
            presentAlert(title: "Error", message: "Password don't match.")
            return
        }
        
        
        let destinationVC = LoginViewController()
        destinationVC.email = emailTextField.text
        destinationVC.password = passTextField.text
        
        navigationController?.pushViewController(destinationVC, animated: true)
        
    }
    
    func isTextFieldsFilled() -> Bool {
        if reTypePassTextField.text == "" || passTextField.text == "" || emailTextField.text == "" || nameTextField.text == "" {
            return false
        }
        
        return true
    }
    
    func isPasswdValid() -> Bool {
        if passTextField.text!.count < 3 {
            return false
        }
        
        return true
    }
    
    func isPasswdMatches() -> Bool {
        if passTextField.text != reTypePassTextField.text {
            return false
        }
        
        return true
    }
}

