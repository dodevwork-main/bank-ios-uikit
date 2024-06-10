//
//  StandingsViewController.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 09.06.2024.
//

import Foundation
import UIKit

protocol StandingsViewControllerInput: AnyObject {}

protocol StandingsViewControllerOutput: AnyObject {
}

final class StandingsViewController: UIViewController {
    
    var output: StandingsViewControllerOutput?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configeViewComponents()
    }
    
    private func configeViewComponents() {
        
    }
}

extension StandingsViewController: StandingsViewControllerInput {}
