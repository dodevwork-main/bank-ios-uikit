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
        addSubview(label)
        addSubview(textField)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leftAnchor.constraint(equalTo: leftAnchor),
            label.rightAnchor.constraint(equalTo: rightAnchor),
            
            textField.topAnchor.constraint(equalTo: label.bottomAnchor),
            textField.rightAnchor.constraint(equalTo: rightAnchor),
            textField.leftAnchor.constraint(equalTo: leftAnchor),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
