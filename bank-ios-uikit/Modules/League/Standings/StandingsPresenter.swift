//
//  StandingsPresenter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 09.06.2024.
//

import Foundation

protocol StandingsModuleInput {
}

final class StandingsPresenter {
    
    var interactor: StandingsInteractorInput?
    weak var view: StandingsViewControllerInput?
    private let router: StandingsRouterInput?
    
    init(router: StandingsRouterInput) {
        self.router = router
    }
}

extension StandingsPresenter: StandingsModuleInput {}

extension StandingsPresenter: StandingsViewControllerOutput {}

extension StandingsPresenter: StandingsInteractorOutput {}
