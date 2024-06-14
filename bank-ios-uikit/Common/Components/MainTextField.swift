//
//  MainTextField.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 07.06.2024.
//

import Foundation
import UIKit

final class MainTextField: UITextField {
    
    override var isSecureTextEntry: Bool {
        didSet {
            if isSecureTextEntry {
                secureButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            } else {
                secureButton.setImage(UIImage(systemName: "eye"), for: .normal)
            }
        }
    }
    
    override var placeholder: String? {
        didSet {
            attributedPlaceholder = NSAttributedString(
                string: placeholder ?? "",
                attributes: [.foregroundColor: UIColor.lightGray]
            )
        }
    }
    
    private lazy var secureButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleSecureButtonTochUpInside), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var borderBorromView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        
        return view
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
        autocorrectionType = .no
        autocapitalizationType = .none
        delegate = self
        textColor = .black
        
        addSubview(borderBorromView)
        
        NSLayoutConstraint.activate([
            borderBorromView.heightAnchor.constraint(equalToConstant: 1),
            borderBorromView.leftAnchor.constraint(equalTo: leftAnchor),
            borderBorromView.rightAnchor.constraint(equalTo: rightAnchor),
            borderBorromView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func secureField(buttonTintColor: UIColor = .white) {
        isSecureTextEntry = true
        
        rightView = secureButton
        rightViewMode = .always
        secureButton.tintColor = buttonTintColor
    }
    
    @objc func handleSecureButtonTochUpInside() {
        isSecureTextEntry = !isSecureTextEntry
    }
}

extension MainTextField: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
