//
//  LoginViewController.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 04.06.2024.
//

import UIKit

protocol LoginViewControllerInput: AnyObject {
    func fillOnePoint()
    func unfillOnePoint()
    func resetPoints()
}

protocol LoginViewControllerOutput: AnyObject {
    func addValueToPinCode(newValue: String)
    func subtractValueToPinCode()
    func logout()
}

final class LoginViewController: UIViewController {
    
    var output: LoginViewControllerOutput?
    
    private lazy var titleLalbel: AuthTitleLabel = {
        let label = AuthTitleLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Введите код"
        
        return label
    }()
    
    private lazy var captioLabel: AuthCaptionLabel = {
        let label = AuthCaptionLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Вы молодец"
        
        return label
    }()
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
        button.tintColor = UIColor.white
        button.addTarget(self, action: #selector(logoutButtonTouchUpInside), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var points: AuthPinCodePoints = {
        let points = AuthPinCodePoints()
        points.translatesAutoresizingMaskIntoConstraints = false
        
        return points
    }()
    
    private lazy var keyboard: AuthPinCodeKeyboard = {
        let keyboard = AuthPinCodeKeyboard()
        keyboard.translatesAutoresizingMaskIntoConstraints = false
        keyboard.delegate = self
        
        return keyboard
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .prymaryBackground
        
        configeViewComponents()
    }
    
    private func configeViewComponents() {
        view.addSubview(titleLalbel)
        view.addSubview(captioLabel)
        view.addSubview(logoutButton)
        view.addSubview(points)
        view.addSubview(keyboard)
        
        NSLayoutConstraint.activate([
            titleLalbel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .mainPadding * 1.5),
            titleLalbel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            titleLalbel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),

            captioLabel.topAnchor.constraint(equalTo: titleLalbel.bottomAnchor, constant: .mainPadding / 2),
            captioLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            captioLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            logoutButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoutButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            points.topAnchor.constraint(equalTo: captioLabel.bottomAnchor, constant: .mainPadding * 2),
            points.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            points.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            keyboard.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            keyboard.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            keyboard.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    @objc func logoutButtonTouchUpInside() {
        output?.logout()
    }
}

extension LoginViewController: LoginViewControllerInput {
    func fillOnePoint() {
        points.addOne()
    }
    
    func unfillOnePoint() {
        points.subtractOne()
    }
    
    func resetPoints() {
        points.reset()
    }
}

extension LoginViewController: AuthPinCodeKeyboardDelegate {
    func pressNumberButton(value: String) {
        output?.addValueToPinCode(newValue: value)
    }
    
    func pressDelete() {
        output?.subtractValueToPinCode()
    }
}
