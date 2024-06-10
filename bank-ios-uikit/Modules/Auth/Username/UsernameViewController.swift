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
    
    private lazy var textField: MainTextField = {
        let textField = MainTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Логин"
        textField.textColor = .white
        textField.addTarget(self, action: #selector(editingChangedTextField), for: .editingChanged)
        
        return textField
    }()
    
    private lazy var submitButton: MainButton = {
        let button = MainButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        button.setTitle("Продолжить", for: .normal)
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
        view.addSubview(submitButton)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: .mainPadding),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -.mainPadding),
            textField.heightAnchor.constraint(equalToConstant: 44),
            
            submitButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: .mainPadding),
            submitButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -.mainPadding),
            submitButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -.mainPadding * 1.5),
        ])
    }
    
    @objc func editingChangedTextField() {
        if textField.text?.count ?? 0 > 5 {
            submitButton.isEnabled = true
        } else {
            submitButton.isEnabled = false
        }
    }
    
    @objc func touchUpInsideAuthButton() {
        output?.submit(username: textField.text ?? "")
    }
}

extension UsernameViewController: UsernameViewControllerInput {}
