//
//  PinCodeViewController.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 31.05.2024.
//

import UIKit

protocol PinCodeViewControllerInput: AnyObject {
    func fillOnePoint()
    func unfillOnePoint()
}

protocol PinCodeViewControllerOutput: AnyObject {
    func addValueToPinCode(newValue: String)
    func subtractValueToPinCode()
}

final class PinCodeViewController: UIViewController {
    
    var output: PinCodeViewControllerOutput?
    
    private lazy var titleLalbel: AuthTitleLabel = {
        let label = AuthTitleLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Придумайте короткий код"
        
        return label
    }()
    
    private lazy var captioLabel: AuthCaptionLabel = {
        let label = AuthCaptionLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Для быстрого входа в мобильный банк и Райффайзен Инвестиции"
        
        return label
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
        view.addSubview(points)
        view.addSubview(keyboard)
        
        NSLayoutConstraint.activate([
            titleLalbel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .mainPadding * 1.5),
            titleLalbel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            titleLalbel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),

            captioLabel.topAnchor.constraint(equalTo: titleLalbel.bottomAnchor, constant: .mainPadding / 2),
            captioLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            captioLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            points.topAnchor.constraint(equalTo: captioLabel.bottomAnchor, constant: .mainPadding * 2),
            points.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            points.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            keyboard.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            keyboard.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            keyboard.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension PinCodeViewController: PinCodeViewControllerInput {
    func fillOnePoint() {
        points.addOne()
    }
    
    func unfillOnePoint() {
        points.subtractOne()
    }
}

extension PinCodeViewController: AuthPinCodeKeyboardDelegate {
    
    func pressNumberButton(value: String) {
        output?.addValueToPinCode(newValue: value)
    }
    
    func pressDelete() {
        output?.subtractValueToPinCode()
    }
}
