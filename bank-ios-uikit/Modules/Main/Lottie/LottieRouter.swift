//
//  LottieRouter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 06.06.2024.
//

import Foundation
import UIKit

protocol LottieRouterInput: AnyObject {}

final class LottieRouter {
    weak var transitionHandler: UIViewController?
}

extension LottieRouter: LottieRouterInput {}
