//
//  StandingsAssembly.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 09.06.2024.
//

import Foundation
import UIKit

final class StandingsAssembly {
    
    func makeModule() -> UIViewController {
        let viewController = viewController()
        let interactor = interactor()
        let router = router(viewController: viewController)
        let presenter = presenter(viewController: viewController, interactor: interactor, router: router)
        
        viewController.output = presenter
        interactor.output = presenter
        
        return viewController
    }
    
    private func viewController() -> StandingsViewController {
        StandingsViewController()
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
