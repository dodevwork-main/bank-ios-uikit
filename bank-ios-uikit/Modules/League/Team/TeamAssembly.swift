//
//  TeamAssembly.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 15.06.2024.
//

import Foundation
import UIKit

final class TeamAssembly {
    
    func makeModule() -> (viewController: UIViewController, moduleInput: TeamModuleInput) {
        let viewController = viewController()
        let router = router(viewController: viewController)
        let presenter = presenter(viewController: viewController, router: router)
        
        viewController.output = presenter
        
        return (viewController, presenter)
    }
    
    private func viewController() -> TeamViewController {
        let viewController = TeamViewController()
        
        let navigationBarAppearance = LeagueNavigationBarAppearance()

        viewController.navigationItem.standardAppearance = navigationBarAppearance
        viewController.navigationItem.compactAppearance = navigationBarAppearance
        viewController.navigationItem.scrollEdgeAppearance = navigationBarAppearance
        
        return viewController
    }
    
    private func router(viewController: UIViewController) -> TeamRouter {
        let router = TeamRouter()
        router.transitionHandler = viewController
        
        return router
    }
    
    private func presenter(viewController: TeamViewControllerInput, router: TeamRouterInput) -> TeamPresenter {
        let presenter = TeamPresenter(router: router)
        presenter.view = viewController
        
        return presenter
    }
}
