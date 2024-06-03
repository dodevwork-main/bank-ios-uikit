//
//  PinCodePresenter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 31.05.2024.
//

import Foundation

protocol PinCodePresenterProtocol {
    var interactor: PinCodeInteractorProtocol? { get set }
    var viewController: PinCodeViewControllerProtocol? { get set }
    var router: PinCodeRouterProtocol? { get set }
    
    func setPinCode(_ pinCodeValue: String)
    
    func interactorDidLogin(with currentUser: User)
}

final class PinCodePresenter: PinCodePresenterProtocol {
   
    
    var interactor: PinCodeInteractorProtocol?
    
    var viewController: PinCodeViewControllerProtocol?
    
    var router: PinCodeRouterProtocol?
    
    func setPinCode(_ pinCodeValue: String) {
        self.interactor?.savePinCode(pinCodeValue)
        
        self.interactor?.login()
    }
    
    func interactorDidLogin(with currentUser: User) {
        DispatchQueue.main.async {
            self.router?.goToMainModule()
        }
    }
}
