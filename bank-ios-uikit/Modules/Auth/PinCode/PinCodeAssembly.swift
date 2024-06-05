//
//  PinCodeAssembly.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 04.06.2024.
//

import Foundation
import UIKit

final class PinCodeAssembly {
    
    func makeModule() -> (UIViewController, PinCodePresenter) {
        let viewController = viewController()
        let interactor = interactor()
        let router = router(viewController: viewController)
        let presenter = presenter(viewController: viewController, interactor: interactor, router: router)
        
        interactor.output = presenter
        viewController.output = presenter
        
        return (viewController, presenter)
    }
    
    private func viewController() -> PinCodeViewController {
        PinCodeViewController()
    }
    
    private func interactor() -> PinCodeInteractor {
        PinCodeInteractor()
    }
    
    private func router(viewController: UIViewController) -> PinCodeRouter {
        let router = PinCodeRouter()
        router.transitionHandler = viewController
        
        return router
    }
    
    private func presenter(viewController: PinCodeViewControllerInput,
                           interactor: PinCodeInteractorInput,
                           router: PinCodeRouterInput) -> PinCodePresenter {
        let presenter = PinCodePresenter(router: router)
        presenter.interactor = interactor
        presenter.view = viewController
        
        return presenter
    }
}

