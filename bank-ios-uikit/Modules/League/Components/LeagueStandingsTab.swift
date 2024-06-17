//
//  LeagueStandingsTab.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 15.06.2024.
//

import Foundation
import UIKit

final class LeagueStandingsTab: UIButton {
    
    var isActive: Bool = false {
        didSet {
            if isActive {
                backgroundColor = .yellow
            } else {
                backgroundColor = .none
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        titleLabel?.font = .preferredFont(forTextStyle: .caption1)
        setTitleColor(.black, for: .normal)
        layer.cornerRadius = .mainPadding * 0.5
    }
}
