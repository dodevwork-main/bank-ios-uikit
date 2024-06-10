//
//  UsernamePresenter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 30.05.2024.
//

import Foundation

final class UsernamePresenter {
    
    weak var view: UsernameViewControllerInput?
    private let router: UsernameRouterInput?
    
    init(router: UsernameRouterInput) {
        self.router = router
    }
}

extension UsernamePresenter: UsernameViewControllerOutput {
    func submit(username: String) {
        let authDto = AuthDto(username: username)
        
        router?.goToPassword(authDto: authDto)
    }
}
