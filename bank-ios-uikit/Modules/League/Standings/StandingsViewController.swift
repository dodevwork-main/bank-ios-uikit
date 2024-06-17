//
//  StandingsViewController.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 09.06.2024.
//

import Foundation
import UIKit

protocol StandingsViewControllerInput: AnyObject {
    func dataWasLoaded()
    func reloadTabs()
    func reloadCalnder()
}

protocol StandingsViewControllerOutput: AnyObject {
    var tabValue: LeagueStandingsTabValue { get set }
    var selectedCalendarDate: Date { get set }
    
    func getInitialData()
    func getTeams() -> [Team]
    func getDateCalendars() -> DateCalendars
    func pressTeamCell(team: Team)
    func pressBackButton()
}

final class StandingsViewController: UIViewController {
    
    var output: StandingsViewControllerOutput?
    
    private lazy var tabBar: LeagueStandingsTabBar = {
        let tabBar = LeagueStandingsTabBar()
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        tabBar.delegate = self
        
        return tabBar
    }()
    
    private lazy var contrainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = .mainPadding
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.masksToBounds = true
        
        return view
    }()
    
    private lazy var loader: Loader = {
        let loader = Loader()
        loader.translatesAutoresizingMaskIntoConstraints = false
        
        return loader
    }()
    
    private lazy var standings: LeagueStandings = {
        let standings = LeagueStandings()
        standings.translatesAutoresizingMaskIntoConstraints = false
        standings.delegate = self
        standings.isHidden = true
        
        return standings
    }()
    
    private lazy var calendar: LeagueCalendar = {
        let calendar = LeagueCalendar()
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.delegate = self
        calendar.isHidden = true
        
        return calendar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Райффазенбанк Лига 3 X 3"
        view.backgroundColor = .black
        
        output?.getInitialData()
        
        reloadTabs()
        reloadCalnder()
        
        configeViewComponents()
    }
    
    private func configeViewComponents() {
        view.addSubview(tabBar)
        view.addSubview(contrainerView)
        view.addSubview(loader)
        
        contrainerView.addSubview(standings)
        contrainerView.addSubview(calendar)
        
        NSLayoutConstraint.activate([
            tabBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tabBar.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tabBar.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            contrainerView.topAnchor.constraint(equalTo: tabBar.bottomAnchor),
            
            contrainerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            contrainerView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            contrainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            loader.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            standings.topAnchor.constraint(equalTo: contrainerView.topAnchor),
            standings.leftAnchor.constraint(equalTo: contrainerView.leftAnchor),
            standings.rightAnchor.constraint(equalTo: contrainerView.rightAnchor),
            standings.bottomAnchor.constraint(equalTo: contrainerView.bottomAnchor),
            
            calendar.topAnchor.constraint(equalTo: contrainerView.topAnchor),
            calendar.leftAnchor.constraint(equalTo: contrainerView.leftAnchor),
            calendar.rightAnchor.constraint(equalTo: contrainerView.rightAnchor),
            calendar.bottomAnchor.constraint(equalTo: contrainerView.bottomAnchor),
        ])
    }
}

extension StandingsViewController: StandingsViewControllerInput {
    
    func dataWasLoaded() {
        loader.stop()
        
        standings.tableView.reloadData()
    }
    
    func reloadCalnder() {
        calendar.reload()
    }
    
    func reloadTabs() {
        guard let tabBarValue = output?.tabValue else { return }
        
        tabBar.updateTabs(tabValue: tabBarValue)
        
        if tabBarValue == .standings {
            standings.isHidden = false
            calendar.isHidden = true
        } else {
            standings.isHidden = true
            calendar.isHidden = false
        }
    }
    
    
}

extension StandingsViewController: LeagueStandingsTabBarDelegate {
    func pressBackButton() {
        output?.pressBackButton()
    }
    
    func pressStandingsTab() {
        output?.tabValue = .standings
    }
    
    func pressCalendarTab() {
        output?.tabValue = .calendar
    }
}

extension StandingsViewController: LeagueStandingsDelegate {
    func getTeams() -> [Team] {
        output?.getTeams() ?? []
    }
    
    func pressTeamCell(team: Team) {
        output?.pressTeamCell(team: team)
    }
}

extension StandingsViewController: LeagueCalendarDelegate {
    func pressBackwordButton() {
        guard let selectedCalendarDate = output?.selectedCalendarDate,
            let newDate = MainDate.calendar.date(byAdding: .day, value: -1, to: selectedCalendarDate) else { return }
        
        output?.selectedCalendarDate = newDate
    }
    
    func pressForwordButton() {
        guard let selectedCalendarDate = output?.selectedCalendarDate,
            let newDate = MainDate.calendar.date(byAdding: .day, value: 1, to: selectedCalendarDate) else { return }
        
        output?.selectedCalendarDate = newDate
    }
    
    
    func getDateCalendarsAndSelectedDate() -> (dateCalendars: DateCalendars, selectedCalendarDate: Date)? {
        guard let output else { return nil }
        
        return (output.getDateCalendars(), output.selectedCalendarDate)
    }
}
