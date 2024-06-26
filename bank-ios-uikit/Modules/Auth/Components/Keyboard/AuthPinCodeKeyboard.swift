//
//  AuthPinCodeKeyboard.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 02.06.2024.
//

import UIKit

protocol AuthPinCodeKeyboardDelegate: AnyObject {
    func pressNumberButton(value: String)
    func pressDelete()
}

final class AuthPinCodeKeyboard: UIView {
    
    weak var delegate: AuthPinCodeKeyboardDelegate?
    
    private lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    private lazy var lineStack1: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    private lazy var lineStack2: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    private lazy var lineStack3: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    private lazy var lineStack4: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    private lazy var button1: AuthPinCodeKeyboardButton = {
        let button = AuthPinCodeKeyboardButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("1", for: .normal)
        button.addTarget(self, action: #selector(pressNumber), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var button2: AuthPinCodeKeyboardButton = {
        let button = AuthPinCodeKeyboardButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("2", for: .normal)
        button.addTarget(self, action: #selector(pressNumber), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var button3: AuthPinCodeKeyboardButton = {
        let button = AuthPinCodeKeyboardButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("3", for: .normal)
        button.addTarget(self, action: #selector(pressNumber), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var button4: AuthPinCodeKeyboardButton = {
        let button = AuthPinCodeKeyboardButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("4", for: .normal)
        button.addTarget(self, action: #selector(pressNumber), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var button5: AuthPinCodeKeyboardButton = {
        let button = AuthPinCodeKeyboardButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("5", for: .normal)
        button.addTarget(self, action: #selector(pressNumber), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var button6: AuthPinCodeKeyboardButton = {
        let button = AuthPinCodeKeyboardButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("6", for: .normal)
        button.addTarget(self, action: #selector(pressNumber), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var button7: AuthPinCodeKeyboardButton = {
        let button = AuthPinCodeKeyboardButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("7", for: .normal)
        button.addTarget(self, action: #selector(pressNumber), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var button8: AuthPinCodeKeyboardButton = {
        let button = AuthPinCodeKeyboardButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("8", for: .normal)
        button.addTarget(self, action: #selector(pressNumber), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var button9: AuthPinCodeKeyboardButton = {
        let button = AuthPinCodeKeyboardButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("9", for: .normal)
        button.addTarget(self, action: #selector(pressNumber), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var button0: AuthPinCodeKeyboardButton = {
        let button = AuthPinCodeKeyboardButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("0", for: .normal)
        button.addTarget(self, action: #selector(pressNumber), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var buttonDelete: AuthPinCodeKeyboardButton = {
        let button = AuthPinCodeKeyboardButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "delete.left"), for: .normal)
        button.tintColor = UIColor.white
        button.addTarget(self, action: #selector(pressDelete), for: .touchUpInside)
        
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
        addSubview(mainStack)
        
        // Lines
        mainStack.addArrangedSubview(lineStack1)
        mainStack.addArrangedSubview(lineStack2)
        mainStack.addArrangedSubview(lineStack3)
        mainStack.addArrangedSubview(lineStack4)
        
        // Line - 1
        lineStack1.addArrangedSubview(button1)
        lineStack1.addArrangedSubview(button2)
        lineStack1.addArrangedSubview(button3)
        
        // Line - 2
        lineStack2.addArrangedSubview(button4)
        lineStack2.addArrangedSubview(button5)
        lineStack2.addArrangedSubview(button6)
        
        // Line - 3
        lineStack3.addArrangedSubview(button7)
        lineStack3.addArrangedSubview(button8)
        lineStack3.addArrangedSubview(button9)
        
        // Line - 4
        lineStack4.addArrangedSubview(UIView())
        lineStack4.addArrangedSubview(button0)
        lineStack4.addArrangedSubview(buttonDelete)
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: topAnchor),
            mainStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStack.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            mainStack.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    @objc func pressNumber(_ sender: UIButton) {
        delegate?.pressNumberButton(value: sender.titleLabel?.text ?? "")
    }
    
    @objc func pressDelete() {
        delegate?.pressDelete()
    }
}
