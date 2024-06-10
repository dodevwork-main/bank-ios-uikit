//
//  LoginAssebmly.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 04.06.2024.
//

import Foundation
import UIKit

final class LoginAssembly {
    
    func makeModule() -> UIViewController {
        let viewController = viewController()
        let interactor = interactor()
        let router = router(viewController: viewController)
        let presenter = presenter(viewController: viewController, interactor: interactor, router: router)
        
        viewController.output = presenter
        interactor.output = presenter
        
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
    
    private func interactor() -> LoginInteractor {
        let interactor = LoginInteractor()
        interactor.coreDataManagerCurrentUser = CoreDataManager.shared
        
        return interactor
    }
    
    private func presenter(viewController: LoginViewControllerInput, interactor: LoginInteractorInput, router: LoginRouterInput) -> LoginPresenter {
        let presenter = LoginPresenter(router: router)
        presenter.view = viewController
        presenter.interactor = interactor
        
        return presenter
    }
}
