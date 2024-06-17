//
//  PlayerViewController.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 15.06.2024.
//

import Foundation
import UIKit

protocol PlayerViewControllerInput: AnyObject {
}

protocol PlayerViewControllerOutput: AnyObject {
    func getPlayer() -> Player?
}

final class PlayerViewController: UIViewController {
    
    var output: PlayerViewControllerOutput?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PlayerMainCell.self, forCellReuseIdentifier: PlayerMainCell.identifier)
        tableView.register(PlayerStatisticCell.self, forCellReuseIdentifier: PlayerStatisticCell.identifier)
        tableView.separatorColor = .clear
        tableView.allowsSelection = false
        
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: output?.getPlayer()?.team?.name ?? "",
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

extension PlayerViewController: PlayerViewControllerInput {
}

extension PlayerViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return 1 }
        
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PlayerMainCell.identifier, for: indexPath) as! PlayerMainCell
            
            guard let player = output?.getPlayer() else { return cell }
            cell.configure(player: player)
            
            return cell
            
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PlayerStatisticCell.identifier, for: indexPath) as! PlayerStatisticCell
        
        guard let player = output?.getPlayer() else { return cell }
        cell.configure(index: indexPath.row, player: player)
        
        return cell
    }
}
