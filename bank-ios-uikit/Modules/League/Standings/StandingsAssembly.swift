//
//  StandingsAssembly.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 09.06.2024.
//

import Foundation
import UIKit

final class StandingsAssembly {
    
    func makeModule() -> (viewController: UIViewController, moduleInput: StandingsModuleInput) {
        let viewController = viewController()
        let interactor = interactor()
        let router = router(viewController: viewController)
        let presenter = presenter(viewController: viewController, interactor: interactor, router: router)
        
        viewController.output = presenter
        interactor.output = presenter
        
        let navigationConroller = UINavigationController(rootViewController: viewController)
        navigationConroller.navigationBar.tintColor = .yellow
        
        return (navigationConroller, presenter)
    }
    
    private func viewController() -> StandingsViewController {
        let viewController = StandingsViewController()
        
        let navigationBarAppearance = LeagueNavigationBarAppearance()

        viewController.navigationItem.standardAppearance = navigationBarAppearance
        viewController.navigationItem.compactAppearance = navigationBarAppearance
        viewController.navigationItem.scrollEdgeAppearance = navigationBarAppearance
        
        return viewController
    }
    
    private func interactor() -> StandingsInteractor {
        StandingsInteractor()
    }
    
    private func router(viewController: UIViewController) -> StandingsRouter {
        let router = StandingsRouter()
        router.transitionHandler = viewController
        
        return router
    }
    
    private func presenter(viewController: StandingsViewControllerInput, interactor: StandingsInteractorInput, router: StandingsRouterInput) -> StandingsPresenter {
        let presenter = StandingsPresenter(router: router)
        presenter.view = viewController
        presenter.interactor = interactor
        
        return presenter
    }
}
