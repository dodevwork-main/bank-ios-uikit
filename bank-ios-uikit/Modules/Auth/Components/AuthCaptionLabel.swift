//
//  AuthCaptionLabel.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 02.06.2024.
//

import UIKit

class AuthCaptionLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        textColor = .gray
        textAlignment = .center
        numberOfLines = 2
        adjustsFontSizeToFitWidth = true
    }
}
