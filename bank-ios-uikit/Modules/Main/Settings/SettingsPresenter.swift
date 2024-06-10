//
//  SettingsPresenter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 06.06.2024.
//

import Foundation

protocol SettingsModuleInput {
    func setCurrentUser(currentUser: CurrentUser)
}

final class SettingsPresenter {
    
    var interactor: SettingsInteractorInput?
    weak var view: SettingsViewControllerInput?
    private let router: SettingsRouterInput?
    
    private var currentUser: CurrentUser?
    
    init(router: SettingsRouterInput) {
        self.router = router
    }
}

extension SettingsPresenter: SettingsModuleInput {

    func setCurrentUser(currentUser: CurrentUser) {
        self.currentUser = currentUser
    }
}

extension SettingsPresenter: SettingsViewControllerOutput {
    func getCurrentUser() -> CurrentUser? {
        self.currentUser
    }
    
    func saveUserData(email: String,
                      phoneNumber: String,
                      pinCode: String,
                      username: String,
                      password: String) {
        guard let updatedCurrentUser = interactor?.updateCurrentUser(email: email,
                                                                     phoneNumber: phoneNumber,
                                                                     pinCode: pinCode,
                                                                     username: username,
                                                                     password: password) else { return }
        
        view?.resignFirstResponderFromTextFields()
        router?.reloadModule(currentUser: updatedCurrentUser)
    }
}

extension SettingsPresenter: SettingsInteractorOutput {}
