//
//  PinCodeRouter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 31.05.2024.
//

import Foundation
import UIKit

protocol PinCodeRouterInput: AnyObject {
    func goToMainModule(currentUser: CurrentUser)
}

final class PinCodeRouter {
    weak var transitionHandler: UIViewController?
}

extension PinCodeRouter: PinCodeRouterInput {
    func goToMainModule(currentUser: CurrentUser) {
        guard let transitionHandler else { return }
        
        transitionHandler.present(MainModuleAssembly().makeModule(currentUser: currentUser), animated: true)
    }
}
