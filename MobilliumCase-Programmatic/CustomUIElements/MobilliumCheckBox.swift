//
//  MobilliumCheckBox.swift
//  MobilliumCase-Programmatic
//
//  Created by Emir Alkal on 2.06.2022.
//

import UIKit

class MobilliumCheckBox: UIButton {
    var isChecked: Bool {
        didSet {
            if isChecked {
                setImage(UIImage(systemName: Images.checkBoxImage.rawValue), for: .normal)
            } else {
                setImage(UIImage(), for: .normal)
            }
        }
    }
    
    init() {
        isChecked = false
        super.init(frame: .zero)
        setSize()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSize() {
        widthAnchor.constraint(equalToConstant: 18).isActive = true
        heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray.cgColor
        
        
    }
    
    func click() {
        isChecked.toggle()
    }
    
}
