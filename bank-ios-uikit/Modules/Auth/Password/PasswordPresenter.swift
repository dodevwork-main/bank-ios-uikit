//
//  PasswordPresenter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 31.05.2024.
//

import Foundation

protocol PasswordModuleInput {
    func setAuthDto(authDto: AuthDtoProtocol)
}

final class PasswordPresenter: PasswordModuleInput {
    
    weak var view: PasswordViewControllerInput?
    private let router: PasswordRouterInput?
    
    private var authDto: AuthDtoProtocol?
    
    init(router: PasswordRouterInput) {
        self.router = router
    }
    
    func setAuthDto(authDto: AuthDtoProtocol) {
        self.authDto = authDto
    }
}

extension PasswordPresenter: PasswordViewControllerOutput {
    func submit(password: String) {
        guard var authDto else { return }
        
        authDto.password = password
        
        router?.goToPinCode(authDto: authDto)
    }
}

