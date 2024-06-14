//
//  LottieAssembly.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 06.06.2024.
//

import Foundation
import UIKit

final class LottieAssebmly {
    
    static let tabTag = 2
    
    func makeModule() -> (viewController: UIViewController, moduleInput: LottieModuleInput) {
        let viewController = viewController()
        let router = router(viewController: viewController)
        let presenter = presenter(viewController: viewController, router: router)
        
        viewController.output = presenter
        
        return (viewController, presenter)
    }
    
    private func viewController() -> LottieViewController {
        LottieViewController()
    }
    
    private func router(viewController: UIViewController) -> LottieRouter {
        let router = LottieRouter()
        router.transitionHandler = viewController
        
        return router
    }
    
    private func presenter(viewController: LottieViewControllerInput, router: LottieRouterInput) -> LottiePresenter {
        let presenter = LottiePresenter(router: router)
        presenter.view = viewController
        
        return presenter
    }
}
