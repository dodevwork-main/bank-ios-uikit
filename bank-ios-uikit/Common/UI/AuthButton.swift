//
//  Button.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 30.05.2024.
//

import UIKit

class AuthButton: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                backgroundColor = .yellow
                setTitleColor(.black, for: .normal)
            } else {
                backgroundColor = .lightGray
                setTitleColor(.white, for: .normal)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        layer.cornerRadius = 10
        setTitle("Продолжить", for: .normal)
        
        isEnabled = false
    }
}
