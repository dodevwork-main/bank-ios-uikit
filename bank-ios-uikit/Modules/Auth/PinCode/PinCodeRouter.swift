//
//  PinCodeRouter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 31.05.2024.
//

import Foundation
import UIKit

protocol PinCodeRouterInput: AnyObject {
    func goToMainModule()
}

final class PinCodeRouter {
    weak var transitionHandler: UIViewController?
}

extension PinCodeRouter: PinCodeRouterInput {
    func goToMainModule() {
        guard let transitionHandler else { return }
        
        let navigation = UINavigationController(rootViewController: HomeAssebmly().makeModule())
        navigation.modalPresentationStyle = .fullScreen
        
        transitionHandler.present(navigation, animated: true)
    }
}
