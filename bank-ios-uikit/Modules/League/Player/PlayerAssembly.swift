//
//  PlayerAssembly.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 15.06.2024.
//

import Foundation
import UIKit

final class PlayerAssembly {
    
    func makeModule() -> (viewController: UIViewController, moduleInput: PlayerModuleInput) {
        let viewController = viewController()
        let router = router(viewController: viewController)
        let presenter = presenter(viewController: viewController, router: router)
        
        viewController.output = presenter
        
        return (viewController, presenter)
    }
    
    private func viewController() -> PlayerViewController {
        let viewController = PlayerViewController()
        
        let navigationBarAppearance = LeagueNavigationBarAppearance()

        viewController.navigationItem.standardAppearance = navigationBarAppearance
        viewController.navigationItem.compactAppearance = navigationBarAppearance
        viewController.navigationItem.scrollEdgeAppearance = navigationBarAppearance
        
        return viewController
    }
    
    private func router(viewController: UIViewController) -> PlayerRouter {
        let router = PlayerRouter()
        router.transitionHandler = viewController
        
        return router
    }
    
    private func presenter(viewController: PlayerViewControllerInput, router: PlayerRouterInput) -> PlayerPresenter {
        let presenter = PlayerPresenter(router: router)
        presenter.view = viewController
        
        return presenter
    }
}
