//
//  LottiePresenter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 06.06.2024.
//

import Foundation

protocol LottieModuleInput {
    func setCurrentUser(currentUser: CurrentUser)
}

final class LottiePresenter {
    
    weak var view: LottieViewControllerInput?
    private let router: LottieRouterInput?
    
    private var currentUser: CurrentUser?
    
    init(router: LottieRouterInput) {
        self.router = router
    }
}

extension LottiePresenter: LottieModuleInput {
    func setCurrentUser(currentUser: CurrentUser) {
        self.currentUser = currentUser
    }
}

extension LottiePresenter: LottieViewControllerOutput {
    func getCurrentUser() -> CurrentUser? {
        self.currentUser
    }
}
