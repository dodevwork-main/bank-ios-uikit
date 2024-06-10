//
//  HomeViewController.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 03.06.2024.
//

import Foundation
import UIKit

protocol HomeViewControllerInput: AnyObject {}

protocol HomeViewControllerOutput: AnyObject {}

final class HomeViewController: UIViewController {
    
    var output: HomeViewControllerOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
}

extension HomeViewController: HomeViewControllerInput {}
