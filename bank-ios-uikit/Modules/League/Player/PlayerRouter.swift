//
//  PlayerRouter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 15.06.2024.
//

import Foundation
import UIKit

protocol PlayerRouterInput: AnyObject {
}

final class PlayerRouter {
    weak var transitionHandler: UIViewController?
}

extension PlayerRouter: PlayerRouterInput {
}
