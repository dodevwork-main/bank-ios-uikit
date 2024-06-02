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
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .gray
        self.textAlignment = .center
        self.numberOfLines = 2
        self.adjustsFontSizeToFitWidth = true
    }
}
