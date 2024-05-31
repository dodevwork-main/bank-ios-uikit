//
//  AnyInteractor.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 30.05.2024.
//

import Foundation

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
}
