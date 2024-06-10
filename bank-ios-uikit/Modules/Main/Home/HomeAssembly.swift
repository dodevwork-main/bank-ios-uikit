//
//  HomeAssembly.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 05.06.2024.
//

import Foundation
import UIKit

final class HomeAssebmly {
    
    func makeModule() -> UIViewController {
        let viewController = viewController()
        let router = router(viewController: viewController)
        let presenter = presenter(viewController: viewController, router: router)
        
        viewController.output = presenter
        
        return viewController
    }
    
    private func viewController() -> HomeViewController {
        HomeViewController()
    }
    
    private func router(viewController: UIViewController) -> HomeRouter {
        let router = HomeRouter()
        router.transitionHandler = viewController
        
        return router
    }
    
    private func presenter(viewController: HomeViewControllerInput, router: HomeRouterInput) -> HomePresenter {
        let presenter = HomePresenter(router: router)
        presenter.view = viewController
        
        return presenter
    }
}
