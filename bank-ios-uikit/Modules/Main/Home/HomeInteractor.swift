//
//  HomeInteractor.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 06.06.2024.
//

import Foundation

protocol HomeInteractorInput: AnyObject {}

protocol HomeInteractorOutput: AnyObject {}

final class HomeInteractor {
    weak var output: HomeInteractorOutput?
}

extension HomeInteractor: HomeInteractorInput {}
