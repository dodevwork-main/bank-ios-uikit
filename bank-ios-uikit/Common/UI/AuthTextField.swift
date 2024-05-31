//
//  AuthTextField.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 30.05.2024.
//

import UIKit

class AuthTextField: UITextField {
    
    override var isSecureTextEntry: Bool {
        didSet {
            if isSecureTextEntry {
                secureButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            } else {
                secureButton.setImage(UIImage(systemName: "eye"), for: .normal)
            }
        }
    }
    
    private lazy var secureButton: UIButton = {
        let button = UIButton()
        
        button.tintColor = .white
        button.frame = CGRect(x: self.frame.size.width - 25, y: 5, width: 15, height: 25)
        button.addTarget(self, action: #selector(toggleIsSecureTextFieldTochUpInside), for: .touchUpInside)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        self.becomeFirstResponder()
                
        self.textColor = .white
        self.attributedPlaceholder = NSAttributedString(
            string: "Placeholder",
            attributes: [NSAttributedString.Key.foregroundColor: AUTH_TEXT_COLOR]
        )
    }
    
    func secureField() {
        self.rightView = secureButton
        self.isSecureTextEntry = true
        self.rightViewMode = .always
    }
    
    @objc func toggleIsSecureTextFieldTochUpInside() {
        self.isSecureTextEntry = !self.isSecureTextEntry
    }
}
