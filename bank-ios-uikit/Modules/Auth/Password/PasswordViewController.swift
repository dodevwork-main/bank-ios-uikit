//
//  PasswordViewController.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 31.05.2024.
//

import UIKit

protocol PasswordViewControllerInput: AnyObject {
    
}

protocol PasswordViewControllerOutput: AnyObject {
    func submit(password: String)
}

final class PasswordViewController: UIViewController {
    
    var output: PasswordViewControllerOutput?
    
    private lazy var titleLalbel: AuthTitleLabel = {
        let label = AuthTitleLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Остался пароль"
        
        return label
    }()
    
    private lazy var captioLabel: AuthCaptionLabel = {
        let label = AuthCaptionLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Убедимся, что это точно вы"
        
        return label
    }()

    private lazy var textField: MainTextField = {
        let textField = MainTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Пароль"
        textField.secureField()
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
        view.addSubview(titleLalbel)
        view.addSubview(captioLabel)
        view.addSubview(textField)
        view.addSubview(submitButton)
        
        NSLayoutConstraint.activate([
            titleLalbel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .mainPadding * 1.5),
            titleLalbel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            titleLalbel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            textField.heightAnchor.constraint(equalToConstant: 44),

            captioLabel.topAnchor.constraint(equalTo: titleLalbel.bottomAnchor, constant: .mainPadding / 2),
            captioLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            captioLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            textField.topAnchor.constraint(equalTo: captioLabel.bottomAnchor, constant: .mainPadding * 2),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: .mainPadding),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -.mainPadding),
            
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
        output?.submit(password: textField.text ?? "")
    }
}

extension PasswordViewController: PasswordViewControllerInput {}
