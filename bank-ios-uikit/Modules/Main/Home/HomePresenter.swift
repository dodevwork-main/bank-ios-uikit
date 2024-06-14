//
//  HomePresenter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 05.06.2024.
//

import Foundation

protocol HomeModuleInput {
    func setCurrentUser(currentUser: CurrentUser)
}

final class HomePresenter {
    
    weak var view: HomeViewControllerInput?
    private let router: HomeRouterInput?
    
    private var currentUser: CurrentUser?
    
    init(router: HomeRouterInput) {
        self.router = router
    }
}

extension HomePresenter: HomeModuleInput {
    func setCurrentUser(currentUser: CurrentUser) {
        self.currentUser = currentUser
    }
}

extension HomePresenter: HomeViewControllerOutput {
    func pressLogoutButton() {
        router?.goToLogin()
    }
    
    func pressLeagueButton() {
        router?.goToLeague()
    }
    
    func pressSettingsButton() {
        router?.goToSettings()
    }
    
    func getCurrentUser() -> CurrentUser? {
        self.currentUser
    }
}

