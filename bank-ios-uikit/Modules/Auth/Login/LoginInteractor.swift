//
//  LoginInteractor.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 06.06.2024.
//

import Foundation

protocol LoginInteractorInput: AnyObject {
    func deleteAllCurentUsers()
    
    func login(with pinCode: String) -> CurrentUser?
}

protocol LoginInteractorOutput: AnyObject {}

final class LoginInteractor {
    weak var output: LoginInteractorOutput?
    
    var coreDataManagerCurrentUser: CoreDataManagerCurrentUser?
}

extension LoginInteractor: LoginInteractorInput {
    
    func login(with pinCode: String) -> CurrentUser? {
        coreDataManagerCurrentUser?.getCurrentUser(with: pinCode)
    }
    
    func deleteAllCurentUsers() {
        _ = coreDataManagerCurrentUser?.deleteAllCurrentUsers()
    }
}
