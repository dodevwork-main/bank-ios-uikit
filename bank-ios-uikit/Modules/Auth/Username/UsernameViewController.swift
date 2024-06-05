//
//  UsernameViewController.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 30.05.2024.
//

import UIKit

protocol UsernameViewControllerInput: AnyObject {
    
}

protocol UsernameViewControllerOutput: AnyObject {
    func submit(username: String)
}

final class UsernameViewController: UIViewController {
    
    var output: UsernameViewControllerOutput?
    
    private lazy var textField: AuthTextField = {
        let textField = AuthTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Логин"
        textField.addTarget(self, action: #selector(editingChangedTextField), for: .editingChanged)
        
        return textField
    }()
    
    private lazy var authButton: UIButton = {
        let button = AuthButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(touchUpInsideAuthButton), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .prymaryBackground
        
        configeViewComponents()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        textField.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
    }
    
    private func configeViewComponents() {
        view.addSubview(textField)
        view.addSubview(authButton)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: .mainPadding),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -.mainPadding),
            
            authButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: .mainPadding),
            authButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -.mainPadding),
            authButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -.mainPadding * 1.5),
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
        output?.submit(username: textField.text ?? "")
    }
}

extension UsernameViewController: UsernameViewControllerInput {}
