//
//  MobilliumLabel.swift
//  MobilliumCase-Programmatic
//
//  Created by Emir Alkal on 2.06.2022.
//

import UIKit

class MobilliumLabel: UILabel {

    init(title: String, fontSize: Int, fontWeight: UIFont.Weight) {
        super.init(frame: .zero)
        
        text = title
        
        numberOfLines = 0
        font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: fontWeight)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
