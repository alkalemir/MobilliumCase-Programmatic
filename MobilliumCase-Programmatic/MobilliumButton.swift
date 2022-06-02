//
//  MobilliumButton.swift
//  MobilliumCase-Programmatic
//
//  Created by Emir Alkal on 2.06.2022.
//

import UIKit

class MobilliumButton: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        configureSettings()
        configureUI(title: title)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSettings() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureUI (title: String) {
        backgroundColor = UIColor(named: Colors.buttonColor.rawValue)
        setTitleColor(.systemBackground, for: .normal)
        //titleLabel?.textColor = .systemBackground
        layer.cornerRadius = 8
        layer.borderColor = UIColor.systemGray.cgColor
        setTitle(title, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
    }
}
