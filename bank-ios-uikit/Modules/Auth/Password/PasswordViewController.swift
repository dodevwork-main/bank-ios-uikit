//
//  PasswordViewController.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 31.05.2024.
//

import UIKit

protocol PasswordViewControllerProtocol {
    var presenter: PasswordPresenterProtocol? { get set }
}

final class PasswordViewController: UIViewController, PasswordViewControllerProtocol {
    
    var presenter: PasswordPresenterProtocol?

    private lazy var textField: AuthTextField = {
        let textField = AuthTextField()
        
        textField.placeholder = "Пароль"
        textField.secureField()
        textField.addTarget(self, action: #selector(editingChangedTextField), for: .editingChanged)
        
        return textField
    }()
    
    private lazy var authButton: UIButton = {
        let button = AuthButton()
        
        button.addTarget(self, action: #selector(touchUpInsideAuthButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var titleLalbel: AuthTitleLabel = {
        let label = AuthTitleLabel()
        
        label.text = "Остался пароль"
        
        return label
    }()
    
    private lazy var captioLabel: AuthCaptionLabel = {
        let label = AuthCaptionLabel()
        
        label.text = "Убедимся, что это точно вы"
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configeViewComponents()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func configeViewComponents() {
        view.addSubview(titleLalbel)
        view.addSubview(captioLabel)
        view.addSubview(textField)
        view.addSubview(authButton)
        
        NSLayoutConstraint.activate([
            titleLalbel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            titleLalbel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            titleLalbel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),

            captioLabel.topAnchor.constraint(equalTo: titleLalbel.bottomAnchor, constant: 8),
            captioLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            captioLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            textField.topAnchor.constraint(equalTo: captioLabel.bottomAnchor, constant: 32),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            
            authButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            authButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            authButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -24)
        ])
    }
    
    @objc func editingChangedTextField() {
        if textField.text?.count ?? 0 > 5 {
            authButton.isEnabled = true
        } else {
            authButton.isEnabled = false
        }
    }
    
    @objc func touchUpInsideAuthButton() {
        presenter?.router?.goToPinCode()
    }
    
    
}
