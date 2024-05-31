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
        
        return textField
    }()
    
    private lazy var authButton: UIButton = {
        let button = AuthButton()
        
        return button
    }()
    
    private lazy var titleLalbel: UILabel = {
        let label = UILabel()
        
        label.text = "Остался пароль"
        label.textColor = .white
        
        return label
    }()
    
    private lazy var captioLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Убедимся, что это точно вы"
        label.textColor = .lightGray
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = AUTH_BACKGROUND_COLOR
        
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
        
        textField.addTarget(self, action: #selector(editingChangedTextField), for: .editingChanged)
        authButton.addTarget(self, action: #selector(touchUpInsideAuthButton), for: .touchUpInside)
        
        titleLalbel.translatesAutoresizingMaskIntoConstraints = false
        captioLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        authButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLalbel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLalbel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            captioLabel.topAnchor.constraint(equalTo: titleLalbel.bottomAnchor),
            captioLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textField.topAnchor.constraint(equalTo: captioLabel.bottomAnchor),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            authButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            authButton.rightAnchor.constraint(equalTo: view.rightAnchor),
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
