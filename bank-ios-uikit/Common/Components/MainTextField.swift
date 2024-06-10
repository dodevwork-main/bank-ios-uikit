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
            self.attributedPlaceholder = NSAttributedString(
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
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        self.delegate = self
        self.textColor = .black
        
        self.addSubview(borderBorromView)
        
        NSLayoutConstraint.activate([
            borderBorromView.heightAnchor.constraint(equalToConstant: 1),
            borderBorromView.leftAnchor.constraint(equalTo: self.leftAnchor),
            borderBorromView.rightAnchor.constraint(equalTo: self.rightAnchor),
            borderBorromView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    func secureField(buttonTintColor: UIColor = .white) {
        self.isSecureTextEntry = true
        
        self.rightView = secureButton
        self.rightViewMode = .always
        self.secureButton.tintColor = buttonTintColor
    }
    
    @objc func handleSecureButtonTochUpInside() {
        self.isSecureTextEntry = !self.isSecureTextEntry
    }
}

extension MainTextField: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
