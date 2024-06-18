//
//  TeamViewController.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 15.06.2024.
//

import Foundation
import UIKit

protocol TeamViewControllerInput: AnyObject {
}

protocol TeamViewControllerOutput: AnyObject {
    func getTeam() -> Team?
    
    func pressPlayerCell(player: Player)
}

final class TeamViewController: UIViewController {
    
    var output: TeamViewControllerOutput?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TeamMainCell.self, forCellReuseIdentifier: TeamMainCell.identifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BaseCell")
        tableView.register(TeamPlayerCell.self, forCellReuseIdentifier: TeamPlayerCell.identifier)
        tableView.separatorColor = .clear
        tableView.allowsSelection = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Лига 3 x 3",
                                                                                         style: .plain,
                                                                                         target: nil,
                                                                                         action: nil)
        
        configeViewComponents()
    }
    
    private func configeViewComponents() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: .mainPadding),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -.mainPadding),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension TeamViewController: TeamViewControllerInput {
}

extension TeamViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return 1 }
        
        let countPlayers = output?.getTeam()?.players?.count ?? 0
        
        return countPlayers == 0 ? 0 : countPlayers + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TeamMainCell.identifier, for: indexPath) as! TeamMainCell
            
            guard let team = output?.getTeam() else { return cell }
            cell.configure(team: team)
            
            return cell
            
        } else if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BaseCell", for: indexPath)
            
            cell.textLabel?.text = "Состав:"
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamPlayerCell.identifier, for: indexPath) as! TeamPlayerCell
        
        guard let player = output?.getTeam()?.players?[indexPath.row - 1] else { return cell }
        cell.configure(player: player)
        cell.delegate = self
        
        return cell
    }
}

extension TeamViewController: TeamPlayerCellDelegate {
    func pressCard(player: Player) {
        output?.pressPlayerCell(player: player)
    }
}
