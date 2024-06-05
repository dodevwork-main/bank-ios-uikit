//
//  PasswordAssebmly.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 04.06.2024.
//

import Foundation
import UIKit

final class PasswordAssebmly {
    
    func makeModule() -> (UIViewController, PasswordModuleInput) {
        let viewController = viewController()
        let router = router(viewController: viewController)
        let presenter = presenter(viewController: viewController, router: router)
        
        viewController.output = presenter
        
        return (viewController, presenter)
    }
    
    private func viewController() -> PasswordViewController {
        PasswordViewController()
    }
    
    private func router(viewController: UIViewController) -> PasswordRouter {
        let router = PasswordRouter()
        router.transitionHandler = viewController
        
        return router
    }
    
    private func presenter(viewController: PasswordViewControllerInput, router: PasswordRouterInput) -> PasswordPresenter {
        let presenter = PasswordPresenter(router: router)
        presenter.view = viewController
        
        return presenter
    }
}
