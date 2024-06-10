//
//  SettingsAssembly.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 06.06.2024.
//

import Foundation
import UIKit

final class SettingsAssebmly {
    
    static let tabTag = 1
    
    func makeModule() -> (viewController: UIViewController, moduleInput: SettingsModuleInput) {
        let viewController = viewController()
        let interactor = interactor()
        let router = router(viewController: viewController)
        let presenter = presenter(viewController: viewController, interactor: interactor, router: router)
        
        viewController.output = presenter
        interactor.output = presenter
        
        return (viewController, presenter)
    }
    
    private func viewController() -> SettingsViewController {
        SettingsViewController()
    }
    
    private func interactor() -> SettingsInteractor {
        let interactor = SettingsInteractor()
        interactor.coreDataManagerCurrentUser = CoreDataManager.shared
        
        return interactor
    }
    
    private func router(viewController: UIViewController) -> SettingsRouter {
        let router = SettingsRouter()
        router.transitionHandler = viewController
        
        return router
    }
    
    private func presenter(viewController: SettingsViewControllerInput, interactor: SettingsInteractorInput, router: SettingsRouterInput) -> SettingsPresenter {
        let presenter = SettingsPresenter(router: router)
        presenter.view = viewController
        presenter.interactor = interactor
        
        return presenter
    }
}
