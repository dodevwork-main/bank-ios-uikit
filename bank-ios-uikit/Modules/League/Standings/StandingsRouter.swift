//
//  StandingsRouter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 09.06.2024.
//

import Foundation
import UIKit

protocol StandingsRouterInput: AnyObject {
}

final class StandingsRouter {
    weak var transitionHandler: UIViewController?
}

extension StandingsRouter: StandingsRouterInput {
}
