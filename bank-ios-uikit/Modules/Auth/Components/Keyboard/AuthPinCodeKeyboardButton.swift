//
//  AuthPinCodeKeyboardButton.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 02.06.2024.
//

import UIKit

final class AuthPinCodeKeyboardButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        titleLabel?.font = .systemFont(ofSize: 50)
    }
}
