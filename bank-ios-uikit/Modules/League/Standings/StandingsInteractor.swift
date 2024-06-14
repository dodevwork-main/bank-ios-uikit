//
//  StandingsInteractor.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 09.06.2024.
//

import Foundation

protocol StandingsInteractorInput: AnyObject {}

protocol StandingsInteractorOutput: AnyObject {}

final class StandingsInteractor {
    weak var output: StandingsInteractorOutput?
}

extension StandingsInteractor: StandingsInteractorInput {}
