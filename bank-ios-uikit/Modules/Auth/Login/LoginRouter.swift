//
//  LoginRouter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 04.06.2024.
//

import Foundation
import UIKit

protocol LoginRouterInput: AnyObject {
    func goToMainModule()
    func goToUsernameModule()
}

final class LoginRouter {
    weak var transitionHandler: UIViewController?
}

extension LoginRouter: LoginRouterInput {
    func goToMainModule() {
        guard let transitionHandler else { return }
        
        let navigation = UINavigationController(rootViewController: HomeAssebmly().makeModule())
        navigation.modalPresentationStyle = .fullScreen
        
        transitionHandler.present(navigation, animated: true)
    }
    
    func goToUsernameModule() {
        guard let transitionHandler else { return }
        
        let navigation = UINavigationController(rootViewController: UsernameAssebmly().makeModule())
        navigation.modalPresentationStyle = .fullScreen
        
        transitionHandler.present(navigation, animated: true)
    }
}
