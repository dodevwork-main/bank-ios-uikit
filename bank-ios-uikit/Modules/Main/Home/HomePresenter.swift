//
//  HomePresenter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 05.06.2024.
//

import Foundation

final class HomePresenter {
    
    weak var view: HomeViewControllerInput?
    private let router: HomeRouterInput?
    
    init(router: HomeRouterInput) {
        self.router = router
    }
}

extension HomePresenter: HomeViewControllerOutput {}
