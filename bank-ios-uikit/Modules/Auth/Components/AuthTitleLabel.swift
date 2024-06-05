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
        self.textColor = .white
        self.textAlignment = .center
        self.font = .boldSystemFont(ofSize: 28)
        self.adjustsFontForContentSizeCategory = true
    }
}
