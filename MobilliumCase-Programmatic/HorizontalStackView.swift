//
//  HorizontalStackView.swift
//  MobilliumCase-Programmatic
//
//  Created by Emir Alkal on 2.06.2022.
//

import UIKit

class HorizontalStackView: UIStackView {
    
    init() {
        super.init(frame: .zero)
        axis = .horizontal
        spacing = 9
        alignment = .center
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
