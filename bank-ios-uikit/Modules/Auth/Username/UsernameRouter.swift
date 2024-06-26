//
//  UsernameRouter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 30.05.2024.
//

import Foundation
import UIKit

protocol UsernameRouterInput: AnyObject {
    func goToPassword(authDto: AuthDtoProtocol)
}

final class UsernameRouter {
    weak var transitionHandler: UIViewController?
}

extension UsernameRouter: UsernameRouterInput {
    func goToPassword(authDto: AuthDtoProtocol) {
        guard let transitionHandler else { return }
        
        let passwordModule = PasswordAssembly().makeModule()
        passwordModule.moduleInput.setAuthDto(authDto: authDto)
        
        transitionHandler.navigationController?.pushViewController(passwordModule.viewController, animated: true)
    }
}
