//
//  LeagueStandingsTable.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 15.06.2024.
//

import Foundation
import UIKit

protocol LeagueStandingsDelegate: AnyObject {
    func getTeams() -> [Team]
    func pressTeamCell(team: Team)
}

final class LeagueStandings: UIView {
    
    weak var delegate: LeagueStandingsDelegate?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(LeagueStandingsCell.self, forCellReuseIdentifier: LeagueStandingsCell.identifier)
        tableView.backgroundColor = .systemGray5
        tableView.separatorColor = .clear
        tableView.allowsSelection = false
        
        return tableView
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
        backgroundColor = .systemGray5
        
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: .mainPadding),
            tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: -.mainPadding),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}


extension LeagueStandings: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.getTeams().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LeagueStandingsCell.identifier, for: indexPath) as! LeagueStandingsCell
        
        guard let cellTeam = delegate?.getTeams()[indexPath.row] else { return cell }
        
        cell.configure(indexPath: indexPath, team: cellTeam)
        cell.delegate = self
        
        return cell
    }
}

extension LeagueStandings: LeagueStandingsCellDelegate {
    func pressCard(team: Team) {
        delegate?.pressTeamCell(team: team)
    }
}
