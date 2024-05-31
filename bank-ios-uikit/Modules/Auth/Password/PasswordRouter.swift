//
//  PasswordRouter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 31.05.2024.
//

import Foundation
import UIKit

protocol PasswordRouterProtocol {
    var entry: (UIViewController & PasswordViewControllerProtocol)? {get set}
    
    static func start() -> PasswordRouterProtocol
    
    func goToPinCode()
}

final class PasswordRouter: PasswordRouterProtocol {
    var entry: (UIViewController & PasswordViewControllerProtocol)?
    
    static func start() -> PasswordRouterProtocol {
        let router = PasswordRouter()
        
        let viewController = PasswordViewController()
        let presenter = PasswordPresenter()
        
        viewController.presenter = presenter
        
        presenter.router = router
        presenter.viewController = viewController
        
        router.entry = viewController
        
        return router
    }
    
    func goToPinCode() {
        let pinCodeRouter = PinCodeRouter.start()
        
        guard let pinCodeViewController = pinCodeRouter.entry else { return }
        guard let viewController = self.entry else { return }
        
        viewController.navigationController?.pushViewController(pinCodeViewController, animated: true)
    }
}
