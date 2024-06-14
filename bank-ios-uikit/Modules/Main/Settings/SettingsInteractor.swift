//
//  SettingsInteractor.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 06.06.2024.
//

import Foundation

protocol SettingsInteractorInput: AnyObject {
    func updateCurrentUser(email: String,
                           phoneNumber: String,
                           pinCode: String,
                           username: String,
                           password: String) -> CurrentUser?
}

protocol SettingsInteractorOutput: AnyObject {}

final class SettingsInteractor {
    weak var output: SettingsInteractorOutput?
    var coreDataManagerCurrentUser: CoreDataManagerCurrentUser?
}

extension SettingsInteractor: SettingsInteractorInput {
    func updateCurrentUser(email: String,
                           phoneNumber: String,
                           pinCode: String,
                           username: String,
                           password: String) -> CurrentUser? {
        coreDataManagerCurrentUser?.updateCurrentUser(email: email,
                                                      phoneNumber: phoneNumber,
                                                      pinCode: pinCode,
                                                      username: username, 
                                                      password: password)
    }
}
