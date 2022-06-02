//
//  MobilliumTextField.swift
//  MobilliumCase-Programmatic
//
//  Created by Emir Alkal on 2.06.2022.
//

import UIKit

class MobilliumTextField: UITextField {
    init(placeholder: String) {
        super.init(frame: .zero)
        configureSettings()
        configureUI(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSettings() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureUI(placeholder: String) {
        self.placeholder = placeholder
        layer.borderColor = UIColor.systemGray2.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
        textAlignment = .center
    }
}
