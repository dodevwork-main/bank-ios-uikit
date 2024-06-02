//
//  PinCodeViewController.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 31.05.2024.
//

import Foundation
import UIKit

protocol PinCodeViewControllerProtocol {
    var presenter: PinCodePresenterProtocol? { get set }
}

final class PinCodeViewController: UIViewController, PinCodeViewControllerProtocol {
    var presenter: PinCodePresenterProtocol?
    
    private var pinCodeValue = ""
    
    private lazy var titleLalbel: AuthTitleLabel = {
        let label = AuthTitleLabel()
        label.text = "Придумайте короткий код"
        return label
    }()
    
    private lazy var captioLabel: AuthCaptionLabel = {
        let label = AuthCaptionLabel()
        label.text = "Для быстрого входа в мобильный банк и Райффайзен Инвестиции"
        return label
    }()
    
    private lazy var points: AuthPinCodePoints = {
        let points = AuthPinCodePoints()

        return points
    }()
    
    private lazy var keyboard: AuthPinCodeKeyboard = {
        let keyboard = AuthPinCodeKeyboard()
        keyboard.delegate = self
        return keyboard
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configeViewComponents()
    }
    
    private func configeViewComponents() {
        view.addSubview(titleLalbel)
        view.addSubview(captioLabel)
        view.addSubview(points)
        view.addSubview(keyboard)
        
        NSLayoutConstraint.activate([
            titleLalbel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            titleLalbel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            titleLalbel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),

            captioLabel.topAnchor.constraint(equalTo: titleLalbel.bottomAnchor, constant: 8),
            captioLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            captioLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            points.topAnchor.constraint(equalTo: captioLabel.bottomAnchor, constant: 32),
            points.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            points.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            keyboard.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            keyboard.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            keyboard.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension PinCodeViewController: AuthPinCodeKeyboardDelegate {
    func valueGot(_ newValue: String) {
        guard self.pinCodeValue.count < 4 else {
            return
        }
        
        self.pinCodeValue += newValue
        self.points.addOne()
        
        if self.pinCodeValue.count == 4 {
            print(self.pinCodeValue)
        }
    }
}
