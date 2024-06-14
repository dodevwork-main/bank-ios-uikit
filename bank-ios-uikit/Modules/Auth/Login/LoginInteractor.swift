//
//  LoginInteractor.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 06.06.2024.
//

import Foundation

protocol LoginInteractorInput: AnyObject {
    func deleteCurentUser()
    
    func login(with pinCode: String) -> CurrentUser?
}

protocol LoginInteractorOutput: AnyObject {}

final class LoginInteractor {
    weak var output: LoginInteractorOutput?
    
    var coreDataManagerCurrentUser: CoreDataManagerCurrentUser?
}

extension LoginInteractor: LoginInteractorInput {
    
    func login(with pinCode: String) -> CurrentUser? {
        let currentUser = coreDataManagerCurrentUser?.getCurrentUser()
        
        guard currentUser?.pinCode == pinCode else { return nil }
        
        return currentUser
    }
    
    func deleteCurentUser() {
        _ = coreDataManagerCurrentUser?.deleteCurrentUser()
    }
}
