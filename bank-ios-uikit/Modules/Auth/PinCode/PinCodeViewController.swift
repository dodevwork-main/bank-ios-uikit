//
//  PinCodeViewController.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 31.05.2024.
//

import Foundation
import UIKit

protocol PinCodeViewControllerProtocol {
    var presenter: PinCodePresenterProtocol? { get set }
}

final class PinCodeViewController: UIViewController, PinCodeViewControllerProtocol {
    var presenter: PinCodePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
