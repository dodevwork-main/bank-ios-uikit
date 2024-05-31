//
//  LoginPresenter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 30.05.2024.
//

import Foundation

protocol LoginPresenterProtocol {
    var router: LoginRouter? { get set }
    var viewController: LoginViewController? { get set }
}

final class LoginPresenter: LoginPresenterProtocol {
  
    var router: LoginRouter?
    
    var viewController: LoginViewController?
}
