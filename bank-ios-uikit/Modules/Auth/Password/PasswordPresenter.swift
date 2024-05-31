//
//  PasswordPresenter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 31.05.2024.
//

import Foundation

protocol PasswordPresenterProtocol {
    var viewController: PasswordViewControllerProtocol? { get set }
    var router: PasswordRouterProtocol? { get set }
}


final class PasswordPresenter: PasswordPresenterProtocol {
    var viewController: PasswordViewControllerProtocol?
    
    var router: PasswordRouterProtocol?
    
    
}
