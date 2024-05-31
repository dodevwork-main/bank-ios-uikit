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
}

final class PinCodePresenter: PinCodePresenterProtocol {
    var interactor: PinCodeInteractorProtocol?
    
    var viewController: PinCodeViewControllerProtocol?
    
    var router: PinCodeRouterProtocol?
    
    
}
