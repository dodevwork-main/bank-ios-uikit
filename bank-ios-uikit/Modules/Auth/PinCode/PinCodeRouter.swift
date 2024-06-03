//
//  PinCodeRouter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 31.05.2024.
//

import Foundation
import UIKit

protocol PinCodeRouterProtocol {
    var entry: (UIViewController & PinCodeViewControllerProtocol)? {get set}
    
    static func start() -> PinCodeRouterProtocol
    
    func goToMainModule()
}

final class PinCodeRouter: PinCodeRouterProtocol {
    var entry: (UIViewController & PinCodeViewControllerProtocol)?
    
    static func start() -> PinCodeRouterProtocol {
        let router = PinCodeRouter()
        
        let viewController = PinCodeViewController()
        let presenter = PinCodePresenter()
        let interactor = PinCodeInteractor()
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.viewController = viewController
        presenter.interactor = interactor
        
        router.entry = viewController
        
        return router
    }
    
    func goToMainModule() {
        let mainModuleViewController = HomeViewController()
        guard let viewController = self.entry else { return }
        
        viewController.navigationController?.pushViewController(mainModuleViewController, animated: true)
    }
    
}
