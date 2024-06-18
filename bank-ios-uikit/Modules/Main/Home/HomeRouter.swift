//
//  HomeRouter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 05.06.2024.
//

import Foundation
import UIKit

protocol HomeRouterInput: AnyObject {
    func goToLeague(currentUser: CurrentUser)
    func goToSettings()
    func goToLogin()
}

final class HomeRouter {
    weak var transitionHandler: UIViewController?
}

extension HomeRouter: HomeRouterInput {
    func goToSettings() {
        guard let transitionHandler else { return }
        
        transitionHandler.tabBarController?.selectedIndex = SettingsAssebmly.tabTag
    }
    
    func goToLeague(currentUser: CurrentUser) {
        guard let transitionHandler else { return }
        
        let standingsModule = StandingsAssembly().makeModule()
        standingsModule.moduleInput.setCurrentUser(currentUser: currentUser)
        standingsModule.viewController.modalPresentationStyle = .fullScreen
        
        transitionHandler.present(standingsModule.viewController, animated: true)
    }
    
    func goToLogin() {
        guard let transitionHandler else { return }
        
        let navigation = UINavigationController(rootViewController: LoginAssembly().makeModule())
        navigation.modalPresentationStyle = .fullScreen
        
        transitionHandler.present(navigation, animated: true)
    }
}

