//
//  LoginViewController.swift
//  MobilliumCase-Programmatic
//
//  Created by Emir Alkal on 2.06.2022.
//

import UIKit

class LoginViewController: UIViewController {

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
    }

    func configure() {
        view.backgroundColor = UIColor(named: Colors.backgroundColor.rawValue)

        configureLoginButton()
        configureTextFields()
        configureCheckBox()
        configureStackView()
        configureHorizontalStackView()
    }
    
    func configureLoginButton() {
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            loginButton.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        loginButton.addTarget(nil, action: #selector(loginButtonPressed), for: .touchUpInside)
    }
    
    func configureTextFields() {
        view.addSubview(passTextField)
        
        NSLayoutConstraint.activate([
            passTextField.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -200),
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
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90),
            stackView.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -80)
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
