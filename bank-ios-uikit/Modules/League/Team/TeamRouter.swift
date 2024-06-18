//
//  TeamRouter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 15.06.2024.
//

import Foundation
import UIKit

protocol TeamRouterInput: AnyObject {
    func goToPlayer(player: Player)
}

final class TeamRouter {
    weak var transitionHandler: UIViewController?
}

extension TeamRouter: TeamRouterInput {
    func goToPlayer(player: Player) {
        guard let transitionHandler else { return }
        
        let playerModule = PlayerAssembly().makeModule()
        playerModule.moduleInput.setPlayer(player: player)
        
        transitionHandler.navigationController?.pushViewController(playerModule.viewController, animated: true)
    }
}
