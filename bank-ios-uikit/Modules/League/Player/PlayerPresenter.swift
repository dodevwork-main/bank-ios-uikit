//
//  PlayerPresenter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 15.06.2024.
//

import Foundation
protocol PlayerModuleInput {
    func setPlayer(player: Player)
}

final class PlayerPresenter {

    weak var view: PlayerViewControllerInput?
    private let router: PlayerRouterInput?
    
    private var player: Player?
    
    init(router: PlayerRouterInput) {
        self.router = router
    }
}

extension PlayerPresenter: PlayerModuleInput {
    func setPlayer(player: Player) {
        self.player = player
    }
}

extension PlayerPresenter: PlayerViewControllerOutput {
    func getPlayer() -> Player? {
        self.player
    }
}
