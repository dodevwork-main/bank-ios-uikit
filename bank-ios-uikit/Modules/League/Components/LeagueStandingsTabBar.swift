//
//  LeagueStandingsTabBar.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 15.06.2024.
//

import Foundation
import UIKit

enum LeagueStandingsTabValue: String {
    case standings = "standings"
    case calendar = "calendar"
}

protocol LeagueStandingsTabBarDelegate: AnyObject {
    func pressBackButton()
    func pressStandingsTab()
    func pressCalendarTab()
}

final class LeagueStandingsTabBar: UIView {
    
    weak var delegate: LeagueStandingsTabBarDelegate?
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.tintColor = .yellow
        button.addTarget(self, action: #selector(handleBackButtonTouchUpInside), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var tabs: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = .mainPadding * 0.5
        
        return view
    }()
    
    private lazy var standingsTab: LeagueStandingsTab = {
        let tab = LeagueStandingsTab()
        tab.translatesAutoresizingMaskIntoConstraints = false
        tab.setTitle("Турнирная таблица", for: .normal)
        tab.addTarget(self, action: #selector(handleStandingsTabTouchUpInside), for: .touchUpInside)
        
        return tab
    }()
    
    private lazy var calendarTab: LeagueStandingsTab = {
        let tab = LeagueStandingsTab()
        tab.translatesAutoresizingMaskIntoConstraints = false
        tab.setTitle("Календарь", for: .normal)
        tab.addTarget(self, action: #selector(handleCalendarTabTouchUpInside), for: .touchUpInside)
        
        return tab
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundColor = .black
        
        addSubview(backButton)
        addSubview(tabs)
        
        tabs.addSubview(standingsTab)
        tabs.addSubview(calendarTab)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: topAnchor),
            backButton.leftAnchor.constraint(equalTo: leftAnchor),
            backButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            tabs.topAnchor.constraint(equalTo: topAnchor, constant: .mainPadding * 0.5),
            tabs.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.mainPadding * 0.5),
            tabs.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            standingsTab.topAnchor.constraint(equalTo: tabs.topAnchor, constant: .mainPadding * 0.1),
            standingsTab.leftAnchor.constraint(equalTo: tabs.leftAnchor, constant: .mainPadding * 0.1),
            standingsTab.rightAnchor.constraint(equalTo: tabs.centerXAnchor, constant: -.mainPadding * 0.1),
            standingsTab.bottomAnchor.constraint(equalTo: tabs.bottomAnchor, constant: -.mainPadding * 0.1),
            
            calendarTab.topAnchor.constraint(equalTo: tabs.topAnchor, constant: .mainPadding * 0.1),
            calendarTab.leftAnchor.constraint(equalTo: tabs.centerXAnchor, constant: .mainPadding * 0.1),
            calendarTab.rightAnchor.constraint(equalTo: tabs.rightAnchor, constant: -.mainPadding * 0.1),
            calendarTab.bottomAnchor.constraint(equalTo: tabs.bottomAnchor, constant: -.mainPadding * 0.1),
        ])
    }
    
    func updateTabs(tabValue: LeagueStandingsTabValue) {
        if tabValue == .standings {
            standingsTab.isActive = true
            calendarTab.isActive = false
        } else {
            standingsTab.isActive = false
            calendarTab.isActive = true
        }
    }
    
    @objc func handleBackButtonTouchUpInside() {
        delegate?.pressBackButton()
    }
    
    @objc func handleStandingsTabTouchUpInside() {
        delegate?.pressStandingsTab()
    }
    
    @objc func handleCalendarTabTouchUpInside() {
        delegate?.pressCalendarTab()
    }
}
