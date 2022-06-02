//
//  LoginViewController.swift
//  MobilliumCase-Programmatic
//
//  Created by Emir Alkal on 2.06.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    var buttonBottomConstraint: NSLayoutConstraint!
    var stackBottomConstraint: NSLayoutConstraint!
    var stackLeadingConstraint: NSLayoutConstraint!
    var stackTrailingConstraint: NSLayoutConstraint!
    var passTextFieldBottomConstraint: NSLayoutConstraint!

    let loginButton         = MobilliumButton(title: "Login")
    let passTextField       = MobilliumTextField(placeholder: "Password")
    let emailTextField      = MobilliumTextField(placeholder: "Email")
    
    let stackView           = UIStackView()
    let horizontal1         = HorizontalStackView()
    let horizontal2         = HorizontalStackView()
    
    let checkBox1           = MobilliumCheckBox()
    let checkBox2           = MobilliumCheckBox()
    
    let label1              = MobilliumLabel(title: "Remind Me", fontSize: 14, fontWeight: .thin)
    let label2              = MobilliumLabel(title: "I accept to get promotional e-mail from Mobillium about ZonZero Program.", fontSize: 14, fontWeight: .thin)
    
    
    var email: String?
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
    }

    func configure() {
        view.backgroundColor = UIColor(named: Colors.backgroundColor.rawValue)
        configureLoginButton()
        configureTextFields()
        configureCheckBox()
        configureStackView()
        configureHorizontalStackView()
    }
    
    @objc func keyboardWillAppear(_ notification: Notification) {
       
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height

            buttonBottomConstraint.constant = -keyboardHeight - 10
            stackBottomConstraint.constant = -10
            stackLeadingConstraint.constant = 10
            stackTrailingConstraint.constant = -10
            passTextFieldBottomConstraint.constant = -110
        }
    }

    @objc func keyboardWillDisappear() {
        buttonBottomConstraint.constant = -60
        stackBottomConstraint.constant = -80
        
        stackLeadingConstraint.constant = 90
        stackTrailingConstraint.constant = -90
        
        passTextFieldBottomConstraint.constant = -200

    }
    
    func configureLoginButton() {
        view.addSubview(loginButton)
        
        buttonBottomConstraint = loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60)
        
        NSLayoutConstraint.activate([
            buttonBottomConstraint,
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            loginButton.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        loginButton.addTarget(nil, action: #selector(loginButtonPressed), for: .touchUpInside)
        
    }
    
    func configureTextFields() {
        view.addSubview(passTextField)
        
        passTextFieldBottomConstraint = passTextField.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -200)
        NSLayoutConstraint.activate([
            passTextFieldBottomConstraint,
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
    }
    
    
    func configureStackView() {
        
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackBottomConstraint = stackView.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -80)
        stackLeadingConstraint = stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90)
        stackTrailingConstraint = stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90)
        
        NSLayoutConstraint.activate([
            stackLeadingConstraint,
            stackTrailingConstraint,
            stackView.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 10),
            stackBottomConstraint
        ])
        
    }
    
    func configureCheckBox() {

        checkBox1.addTarget(nil, action: #selector(checkBox1Pressed), for: .touchUpInside)
        checkBox2.addTarget(nil, action: #selector(checkBox2Pressed), for: .touchUpInside)
    }
    
   
    func configureHorizontalStackView() {
        horizontal1.addArrangedSubview(checkBox1)
        horizontal1.addArrangedSubview(label1)
        
        horizontal2.addArrangedSubview(checkBox2)
        horizontal2.addArrangedSubview(label2)
        
        stackView.addArrangedSubview(horizontal1)
        stackView.addArrangedSubview(horizontal2)
        
        horizontal2.isHidden = true
    }
    
    @objc func loginButtonPressed() {
        if (isEmailMatches() && isPasswordMatches()) {
            let destinationVC = MovieListViewController()
            
            navigationController?.pushViewController(destinationVC, animated: true)
        } else {
            presentAlert(title: "Error", message: "Username or password is wrong!")
        }
    }
    
    @objc func checkBox1Pressed(_ checkbox: MobilliumCheckBox) {
        checkbox.click()
        
        if checkbox.isChecked {
            horizontal2.isHidden = false
            checkBox2.isChecked = false
        } else {
            horizontal2.isHidden = true
        }
    }
    
    @objc func checkBox2Pressed(_ checkbox: MobilliumCheckBox) {
        checkbox.click()
    }
    
 
    func isEmailMatches() -> Bool {
        if email == emailTextField.text {
            return true
        }
        
        return false
    }
    
    func isPasswordMatches() -> Bool {
        if password == passTextField.text {
            return true
        }
        
        return false
    }
}
