//
//  LoginAssebmly.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 04.06.2024.
//

import Foundation
import UIKit

final class LoginAssebmly {
    
    func makeModule() -> UIViewController {
        let viewController = viewController()
        let router = router(viewController: viewController)
        let presenter = presenter(viewController: viewController, router: router)
        
        viewController.output = presenter
        
        return viewController
    }
    
    private func viewController() -> LoginViewController {
        LoginViewController()
    }
    
    private func router(viewController: UIViewController) -> LoginRouter {
        let router = LoginRouter()
        router.transitionHandler = viewController
        
        return router
    }
    
    private func presenter(viewController: LoginViewControllerInput, router: LoginRouterInput) -> LoginPresenter {
        let presenter = LoginPresenter(router: router)
        presenter.view = viewController
        
        return presenter
    }
}
