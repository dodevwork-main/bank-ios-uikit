//
//  HomeAssembly.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 05.06.2024.
//

import Foundation
import UIKit

final class HomeAssebmly {
    
    static let tabTag = 0
    
    func makeModule() -> (viewController: UIViewController, moduleInput: HomeModuleInput) {
        let viewController = viewController()
        let interactor = interactor()
        let router = router(viewController: viewController)
        let presenter = presenter(viewController: viewController, interactor: interactor, router: router)
        
        viewController.output = presenter
        interactor.output = presenter
        
        return (viewController, presenter)
    }
    
    private func viewController() -> HomeViewController {
        HomeViewController()
    }
    
    private func interactor() -> HomeInteractor {
        HomeInteractor()
    }
    
    private func router(viewController: UIViewController) -> HomeRouter {
        let router = HomeRouter()
        router.transitionHandler = viewController
        
        return router
    }
    
    private func presenter(viewController: HomeViewControllerInput, interactor: HomeInteractorInput, router: HomeRouterInput) -> HomePresenter {
        let presenter = HomePresenter(router: router)
        presenter.view = viewController
        presenter.interactor = interactor
        
        return presenter
    }
}
