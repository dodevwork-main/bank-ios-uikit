//
//  AuthTitleLabel.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 02.06.2024.
//

import UIKit

class AuthTitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        textColor = .white
        textAlignment = .center
        font = .boldSystemFont(ofSize: 28)
        adjustsFontForContentSizeCategory = true
    }
}
