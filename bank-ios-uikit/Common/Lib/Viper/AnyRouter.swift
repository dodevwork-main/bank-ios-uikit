//
//  AnyRouter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 30.05.2024.
//

import Foundation
import UIKit

//typealias EntryPoint<T> = UIViewController & T

protocol AnyRouter {
    static func start() -> AnyRouter
}
