//
//  AuthPinCodePoints.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 02.06.2024.
//

import UIKit

final class AuthPinCodePoints: UIView {
    
    private var value = 0
    
    private lazy var point1: AuthPinCodePoint = {
        let point = AuthPinCodePoint()
        
        return point
    }()
    
    private lazy var point2: AuthPinCodePoint = {
        let point = AuthPinCodePoint()
        
        return point
    }()

    private lazy var point3: AuthPinCodePoint = {
        let point = AuthPinCodePoint()
        
        return point
    }()

    private lazy var point4: AuthPinCodePoint = {
        let point = AuthPinCodePoint()
        
        return point
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 24
        return stack
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
        self.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(stack)
        
        stack.addArrangedSubview(point1)
        stack.addArrangedSubview(point2)
        stack.addArrangedSubview(point3)
        stack.addArrangedSubview(point4)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: self.topAnchor),
            stack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    func addOne() {
        guard self.value < 4 else {
            return
        }
        
        self.value += 1
        
        switch self.value {
        case 1:
            point1.isSet = true
        case 2:
            point2.isSet = true
        case 3:
            point3.isSet = true
        case 4:
            point4.isSet = true
        default:
            return
        }
    }
    
    func subtractOne() {
        guard self.value > 0 else {
            return
        }
        
        self.value -= 1
        
        switch self.value {
        case 0:
            point1.isSet = false
        case 1:
            point2.isSet = false
        case 2:
            point3.isSet = false
        case 3:
            point4.isSet = false
        default:
            return
        }
        
        
    }
}
