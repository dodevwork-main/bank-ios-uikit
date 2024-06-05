//
//  PasswordRouter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 31.05.2024.
//

import Foundation
import UIKit

protocol PasswordRouterInput: AnyObject {
    func goToPinCode(authDto: AuthDtoProtocol)
}

final class PasswordRouter {
    weak var transitionHandler: UIViewController?
}

extension PasswordRouter: PasswordRouterInput {
    func goToPinCode(authDto: AuthDtoProtocol) {
        guard let transitionHandler else { return }
        
        let pinCodeModule = PinCodeAssembly().makeModule()
        pinCodeModule.1.setAuthDto(authDto: authDto)
        
        transitionHandler.navigationController?.pushViewController(pinCodeModule.0, animated: true)
    }
}
