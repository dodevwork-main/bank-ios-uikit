//
//  HomeRouter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 05.06.2024.
//

import Foundation
import UIKit

protocol HomeRouterInput: AnyObject {}

final class HomeRouter {
    weak var transitionHandler: UIViewController?
}

extension HomeRouter: HomeRouterInput {}

