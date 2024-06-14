//
//  SettingsRouter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 06.06.2024.
//

import Foundation
import UIKit

protocol SettingsRouterInput: AnyObject {
    func reloadModule(currentUser: CurrentUser)
}

final class SettingsRouter {
    weak var transitionHandler: UIViewController?
}

extension SettingsRouter: SettingsRouterInput {
    func reloadModule(currentUser: CurrentUser) {
        guard let transitionHandler else { return }
        
        transitionHandler.present(MainModuleAssembly().makeModule(currentUser: currentUser, selectedIndex: SettingsAssebmly.tabTag), animated: false)
    }
}
