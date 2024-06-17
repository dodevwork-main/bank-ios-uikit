//
//  LeagueNavigationBarAppearance.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 15.06.2024.
//

import Foundation
import UIKit

final class LeagueNavigationBarAppearance: UINavigationBarAppearance {
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override init(idiom: UIUserInterfaceIdiom) {
        super.init(idiom: idiom)
        setup()
    }
    
    override init(barAppearance: UIBarAppearance) {
        super.init(barAppearance: barAppearance)
    }
    
    private func setup() {
        configureWithDefaultBackground()
        titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.yellow]
        backgroundColor = .black
    }
}
