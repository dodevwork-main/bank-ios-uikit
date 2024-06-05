//
//  LoginPresenter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 04.06.2024.
//

import Foundation

final class LoginPresenter {
    
    weak var view: LoginViewControllerInput?
    private let router: LoginRouterInput?
    
    private var pinCodeValue: String = ""
    
    init(router: LoginRouterInput) {
        self.router = router
    }
}

extension LoginPresenter: LoginViewControllerOutput {
    
    func addValueToPinCode(newValue: String) {
        guard pinCodeValue.count < 4 else { return }
        
        pinCodeValue += newValue
        
        view?.fillOnePoint()

        if pinCodeValue.count == 4 {
            let currentUser = CoreDataManager.shared.fetchCurrentUser(pinCode: pinCodeValue)
            
            guard currentUser != nil else {
                // Reset PinCode
                pinCodeValue = ""
                view?.resetPoints()
                
                return
            }
            
            router?.goToMainModule()
        }
    }
    
    func subtractValueToPinCode() {
        guard pinCodeValue.count > 0 else { return }
        
        pinCodeValue = String(pinCodeValue.dropLast())
        
        view?.unfillOnePoint()
    }
    
    func logout() {
        guard CoreDataManager.shared.deleteAllCurrentUsers() != nil else { return }
        
        router?.goToUsernameModule()
    }
}
