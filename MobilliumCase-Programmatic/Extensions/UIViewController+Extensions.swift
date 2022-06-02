//
//  UIViewController+Extensions.swift
//  MobilliumCase-Programmatic
//
//  Created by Emir Alkal on 2.06.2022.
//

import UIKit

extension UIViewController {
    
    func presentAlert(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Error", style: .default))
        
        present(ac, animated: true)
    }
}

extension RegisterViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (!isTextFieldsFilled()) {
            presentAlert(title: "Error", message: "Please enter all information.")
        } else if (!isPasswdValid()) {
            presentAlert(title: "Error", message: "Passwors must be longer than 3 digits.")
        } else if (!isPasswdMatches()) {
            presentAlert(title: "Error", message: "Password don't match.")
        }
        
        return true
    }
}

