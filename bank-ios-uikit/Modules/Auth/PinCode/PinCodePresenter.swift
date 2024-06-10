//
//  PinCodePresenter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 31.05.2024.
//

import Foundation

protocol PinCodeModuleInput {
    func setAuthDto(authDto: AuthDtoProtocol)
}

final class PinCodePresenter: PinCodeModuleInput {
    
    var interactor: PinCodeInteractorInput?
    weak var view: PinCodeViewControllerInput?
    private let router: PinCodeRouterInput?
    
    private var pinCodeValue: String = ""
    private var authDto: AuthDtoProtocol?
    
    init(router: PinCodeRouterInput) {
        self.router = router
    }
    
    func setAuthDto(authDto: AuthDtoProtocol) {
        self.authDto = authDto
    }
}

extension PinCodePresenter: PinCodeViewControllerOutput {
    
    func addValueToPinCode(newValue: String) {
        guard pinCodeValue.count < 4 else { return }
        
        pinCodeValue += newValue
        self.authDto?.pinCode = pinCodeValue
        
        view?.fillOnePoint()

        if pinCodeValue.count == 4 {
            guard let authDto else { return }
            interactor?.signUp(authDto: authDto)
        }
    }
    
    func subtractValueToPinCode() {
        guard pinCodeValue.count > 0 else { return }
        
        pinCodeValue = String(pinCodeValue.dropLast())
        
        view?.unfillOnePoint()
    }
}

extension PinCodePresenter: PinCodeInteractorOutput {
    func didSignUp(newUser: User) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            
            guard let authDto = self.authDto else { return }
            
            guard let currentUser = interactor?.createCurrentUser(user: newUser, authDto: authDto) else { return }
            print(currentUser)
            
            self.router?.goToMainModule(currentUser: currentUser)
        }
    }
}
