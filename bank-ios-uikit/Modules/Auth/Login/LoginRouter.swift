//
//  LoginRouter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 04.06.2024.
//

import Foundation
import UIKit

protocol LoginRouterInput: AnyObject {
    func goToMainModule(currentUser: CurrentUser)
    func goToUsernameModule()
}

final class LoginRouter {
    weak var transitionHandler: UIViewController?
}

extension LoginRouter: LoginRouterInput {
    func goToMainModule(currentUser: CurrentUser) {
        guard let transitionHandler else { return }
        
        transitionHandler.present(MainModuleAssembly().makeModule(currentUser: currentUser), animated: true)
    }
    
    func goToUsernameModule() {
        guard let transitionHandler else { return }
        
        let navigation = UINavigationController(rootViewController: UsernameAssembly().makeModule())
        navigation.modalPresentationStyle = .fullScreen
        
        transitionHandler.present(navigation, animated: true)
    }
}
