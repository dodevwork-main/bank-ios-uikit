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
                self.backgroundColor = .white
            } else {
                self.backgroundColor = .gray
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
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isSet = false
        
        self.layer.cornerRadius = size / 2
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: size),
            self.widthAnchor.constraint(equalToConstant: size),
        ])
    }
}
