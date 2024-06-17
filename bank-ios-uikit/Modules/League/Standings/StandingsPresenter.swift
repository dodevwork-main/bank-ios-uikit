//
//  StandingsPresenter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 09.06.2024.
//

import Foundation

// TODO: make Array with structs DateCalendars sorted by time
typealias DateCalendars = [Date: [CalendarEntity]]

protocol StandingsModuleInput {
    func setCurrentUser(currentUser: CurrentUser)
}

final class StandingsPresenter {
    
    var interactor: StandingsInteractorInput?
    weak var view: StandingsViewControllerInput?
    private let router: StandingsRouterInput?
    
    private var currentUser: CurrentUser?
    
    private var dateCalendars: DateCalendars?
    private var teams: [Team]?
    
    var tabValue: LeagueStandingsTabValue = .standings {
        didSet {
            view?.reloadTabs()
        }
    }
    
    var selectedCalendarDate: Date = Date() {
        didSet {
            view?.reloadCalnder()
        }
    }
    
    init(router: StandingsRouterInput) {
        self.router = router
    }
}

extension StandingsPresenter: StandingsModuleInput {
    func setCurrentUser(currentUser: CurrentUser) {
        self.currentUser = currentUser
    }
}

extension StandingsPresenter: StandingsViewControllerOutput {
    
    
    func pressBackButton() {
        guard let currentUser else { return }
        
        router?.goToMainModule(currentUser: currentUser)
    }
    
    func pressTeamCell(team: Team) {
        router?.goToTeam(team: team)
    }
    
    func getDateCalendars() -> DateCalendars {
        return self.dateCalendars ?? [:]
    }
    
    func getTeams() -> [Team] {
        return self.teams ?? []
    }
    
    func getInitialData() {
        interactor?.getInitialData() {(dateCalendars, teams) in
            self.dateCalendars = dateCalendars
            self.teams = teams
            
            self.view?.dataWasLoaded()
        }
    }
}

extension StandingsPresenter: StandingsInteractorOutput {}
