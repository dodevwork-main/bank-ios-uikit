//
//  AuthPinCodePoint.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 02.06.2024.
//

import UIKit

final class AuthPinCodePoint: UIView {
    private let size: CGFloat = 15
    
    var isSet: Bool = false {
        didSet {
            if isSet {
                backgroundColor = .white
            } else {
                backgroundColor = .gray
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        isSet = false
        
        layer.cornerRadius = size / 2
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: size),
            widthAnchor.constraint(equalToConstant: size),
        ])
    }
}
