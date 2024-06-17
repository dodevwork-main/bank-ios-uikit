//
//  TeamPresenter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 15.06.2024.
//

import Foundation
protocol TeamModuleInput {
    func setTeam(team: Team)
}

final class TeamPresenter {

    weak var view: TeamViewControllerInput?
    private let router: TeamRouterInput?
    
    private var team: Team?
    
    init(router: TeamRouterInput) {
        self.router = router
    }
}

extension TeamPresenter: TeamModuleInput {
    func setTeam(team: Team) {
        self.team = team
    }
}

extension TeamPresenter: TeamViewControllerOutput {
    func pressPlayerCell(player: Player) {
        router?.goToPlayer(player: player)
    }
    
    func getTeam() -> Team? {
        return self.team
    }
    
}
