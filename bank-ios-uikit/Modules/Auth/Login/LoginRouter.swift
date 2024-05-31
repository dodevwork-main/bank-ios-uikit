//
//  LoginRouter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 30.05.2024.
//

import Foundation
import UIKit

protocol LoginRouterProtocol {
    var entry: (UIViewController & LoginViewControllerProtocol)? {get set}
    
    static func start() -> LoginRouterProtocol
    
    func goToPassword()
}

final class LoginRouter: LoginRouterProtocol {
    var entry: (UIViewController & LoginViewControllerProtocol)?
    
    static func start() -> LoginRouterProtocol {
        let router = LoginRouter()
        
        let viewController = LoginViewController()
        let presenter = LoginPresenter()
        
        viewController.presenter = presenter
        
        presenter.router = router
        presenter.viewController = viewController
        
        router.entry = viewController
        
        return router
    }
    
    func goToPassword() {
        let passwordRouter = PasswordRouter.start()
        
        guard let passwordViewController = passwordRouter.entry else { return }
        guard let viewController = self.entry else { return }
        
        viewController.navigationController?.pushViewController(passwordViewController, animated: true)
    }
}
