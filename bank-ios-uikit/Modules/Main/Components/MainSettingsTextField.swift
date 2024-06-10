//
//  MainSettingsTextField.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 08.06.2024.
//

import Foundation
import UIKit

final class MainSettingsTextField: UIView {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        
        return label
    }()
    
    lazy var textField: MainTextField = {
        let textField = MainTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
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
        self.addSubview(label)
        self.addSubview(textField)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leftAnchor.constraint(equalTo: self.leftAnchor),
            label.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            textField.topAnchor.constraint(equalTo: label.bottomAnchor),
            textField.rightAnchor.constraint(equalTo: self.rightAnchor),
            textField.leftAnchor.constraint(equalTo: self.leftAnchor),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
