//
//  StandingsRouter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 09.06.2024.
//

import Foundation
import UIKit

protocol StandingsRouterInput: AnyObject {
    func goToTeam(team: Team)
    func goToMainModule(currentUser: CurrentUser)
}

final class StandingsRouter {
    weak var transitionHandler: UIViewController?
}

extension StandingsRouter: StandingsRouterInput {
    
    func goToMainModule(currentUser: CurrentUser) {
        guard let transitionHandler else { return }
        
        transitionHandler.present(MainModuleAssembly().makeModule(currentUser: currentUser), animated: true)
    }
    
    func goToTeam(team: Team) {
        guard let transitionHandler else { return }
        
        let teamModule = TeamAssembly().makeModule()
        teamModule.moduleInput.setTeam(team: team)
        
        transitionHandler.navigationController?.pushViewController(teamModule.viewController, animated: true)
    }
}
