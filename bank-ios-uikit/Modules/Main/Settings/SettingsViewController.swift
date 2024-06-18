//
//  SettingsViewController.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 06.06.2024.
//

import Foundation
import UIKit

protocol SettingsViewControllerInput: AnyObject {
    func resignFirstResponderFromTextFields()
}

protocol SettingsViewControllerOutput: AnyObject {
    func getCurrentUser() -> CurrentUser?
    func saveUserData(email: String,
                      phoneNumber: String,
                      pinCode: String,
                      username: String,
                      password: String)
}

final class SettingsViewController: UIViewController {
    
    var output: SettingsViewControllerOutput?
    
    private lazy var emailTextFieldView: MainSettingsTextField = {
        let view = MainSettingsTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.label.text = "E-mail"
        
        if let email = output?.getCurrentUser()?.email { view.textField.text = email }
        
        return view
    }()
    
    private lazy var phoneNumberTextFieldView: MainSettingsTextField = {
        let view = MainSettingsTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.label.text = "Номер телефона"
        
        if let phoneNumber = output?.getCurrentUser()?.phoneNumber { view.textField.text = phoneNumber }
        
        return view
    }()
    
    private lazy var usernameTextFieldView: MainSettingsTextField = {
        let view = MainSettingsTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.label.text = "Username"
        
        if let username = output?.getCurrentUser()?.username { view.textField.text = username }
        
        return view
    }()
    
    private lazy var passwordTextFieldView: MainSettingsTextField = {
        let view = MainSettingsTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textField.secureField(buttonTintColor: .black)
        view.label.text = "Пароль"
        
        if let password = output?.getCurrentUser()?.password { view.textField.text = password }
        
        return view
    }()
    
    private lazy var pinCodeTextFieldView: MainSettingsTextField = {
        let view = MainSettingsTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.label.text = "Пин-код"
        
        if let pinCode = output?.getCurrentUser()?.pinCode { view.textField.text = pinCode }
        
        return view
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = .mainPadding

        stack.addArrangedSubview(emailTextFieldView)
        stack.addArrangedSubview(phoneNumberTextFieldView)
        stack.addArrangedSubview(usernameTextFieldView)
        stack.addArrangedSubview(passwordTextFieldView)
        stack.addArrangedSubview(pinCodeTextFieldView)
        
        return stack
    }()
    
    private lazy var submitButton: MainButton = {
        let button = MainButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Подтвердить", for: .normal)
        button.addTarget(self, action: #selector(handleSubmitButtonTouchUpInside), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private lazy var contrainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = .mainPadding
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        configeViewComponents()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        resignFirstResponderFromTextFields()
    }
    
    private func configeViewComponents() {
        view.addSubview(contrainerView)
        
        contrainerView.addSubview(scrollView)
        contrainerView.addSubview(submitButton)
        
        scrollView.addSubview(stack)
        
        NSLayoutConstraint.activate([
            contrainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contrainerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            contrainerView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            contrainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            scrollView.topAnchor.constraint(equalTo: contrainerView.topAnchor, constant: .mainPadding),
            scrollView.leftAnchor.constraint(equalTo: contrainerView.leftAnchor, constant: .mainPadding),
            scrollView.rightAnchor.constraint(equalTo: contrainerView.rightAnchor, constant: -.mainPadding),
            scrollView.bottomAnchor.constraint(equalTo: submitButton.topAnchor, constant: -.mainPadding),
            
            stack.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stack.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            stack.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            stack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stack.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            submitButton.leftAnchor.constraint(equalTo: contrainerView.leftAnchor, constant: .mainPadding),
            submitButton.rightAnchor.constraint(equalTo: contrainerView.rightAnchor, constant: -.mainPadding),
            submitButton.bottomAnchor.constraint(equalTo: contrainerView.keyboardLayoutGuide.topAnchor, constant: -.mainPadding),
        ])
    }
    
    @objc func handleSubmitButtonTouchUpInside() {
        guard let email = emailTextFieldView.textField.text,
                let phoneNumber = phoneNumberTextFieldView.textField.text,
                let pinCode = pinCodeTextFieldView.textField.text,
                let password = passwordTextFieldView.textField.text,
                let username = usernameTextFieldView.textField.text else { return }
        
        output?.saveUserData(email: email,
                             phoneNumber: phoneNumber,
                             pinCode: pinCode,
                             username: username,
                             password: password)
    }
}

extension SettingsViewController: SettingsViewControllerInput {
    func resignFirstResponderFromTextFields() {
        emailTextFieldView.textField.resignFirstResponder()
        phoneNumberTextFieldView.textField.resignFirstResponder()
        usernameTextFieldView.textField.resignFirstResponder()
        passwordTextFieldView.textField.resignFirstResponder()
        pinCodeTextFieldView.textField.resignFirstResponder()
    }
}
