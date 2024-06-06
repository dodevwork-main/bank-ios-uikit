//
//  UsernameAssebmly.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 04.06.2024.
//

import Foundation
import UIKit

final class UsernameAssembly {
    
    func makeModule() -> UIViewController {
        let viewController = viewController()
        let router = router(viewController: viewController)
        let presenter = presenter(viewController: viewController, router: router)
        
        viewController.output = presenter
        
        return viewController
    }
    
    private func viewController() -> UsernameViewController {
        UsernameViewController()
    }
    
    private func router(viewController: UIViewController) -> UsernameRouter {
        let router = UsernameRouter()
        router.transitionHandler = viewController
        
        return router
    }
    
    private func presenter(viewController: UsernameViewControllerInput, router: UsernameRouterInput) -> UsernamePresenter {
        let presenter = UsernamePresenter(router: router)
        presenter.view = viewController
        
        return presenter
    }
}
