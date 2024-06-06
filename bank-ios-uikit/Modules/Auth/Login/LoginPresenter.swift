//
//  LoginPresenter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 04.06.2024.
//

import Foundation

final class LoginPresenter {
    
    var interactor: LoginInteractorInput?
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
            guard interactor?.login(with: pinCodeValue) != nil else {
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
        interactor?.deleteAllCurentUsers()
        
        router?.goToUsernameModule()
    }
}

extension LoginPresenter: LoginInteractorOutput {}
