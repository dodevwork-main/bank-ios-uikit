//
//  AnyViewController.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 30.05.2024.
//

import Foundation
import UIKit

protocol AnyView {
    var presenter: AnyPresenter? { get set }
}
