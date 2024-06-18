//
//  LeagueStandingsCell.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 14.06.2024.
//

import Foundation
import UIKit

protocol LeagueStandingsCellDelegate: AnyObject {
    func pressCard(team: Team)
}

final class LeagueStandingsCell: UITableViewCell {
    
    static let identifier = "LeagueStandingsCell"
    
    private var team: Team?
    
    weak var delegate: LeagueStandingsCellDelegate?
    
    private lazy var card: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = .mainPadding * 0.5
        button.addTarget(self, action: #selector(handleCardTouchUpInside), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var indexlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: .mainPadding, weight: .bold)
        
        return label
    }()
    
    private lazy var winsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = .systemFont(ofSize: .mainPadding * 0.9)
        
        return label
    }()
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var pictureView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "cube.box.fill"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = .mainPadding * 0.5
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.cgColor
        
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundColor = .systemGray5
        
        contentView.addSubview(card)
        
        card.addSubview(indexlabel)
        card.addSubview(pictureView)
        card.addSubview(nameLabel)
        card.addSubview(winsLabel)
        card.addSubview(scoreLabel)
        
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .mainPadding * 0.5),
            card.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            card.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            card.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            indexlabel.leftAnchor.constraint(equalTo: card.leftAnchor, constant: .mainPadding),
            indexlabel.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            
            pictureView.heightAnchor.constraint(equalToConstant: 50),
            pictureView.widthAnchor.constraint(equalToConstant: 50),
            pictureView.leftAnchor.constraint(equalTo: indexlabel.rightAnchor, constant: .mainPadding),
            pictureView.topAnchor.constraint(equalTo: card.topAnchor, constant: .mainPadding * 0.25),
            pictureView.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -.mainPadding * 0.25),
            pictureView.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: card.topAnchor, constant: .mainPadding * 0.25),
            nameLabel.leftAnchor.constraint(equalTo: pictureView.rightAnchor, constant: .mainPadding),
            
            winsLabel.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -.mainPadding * 0.25),
            winsLabel.leftAnchor.constraint(equalTo: pictureView.rightAnchor, constant: .mainPadding),
            
            scoreLabel.rightAnchor.constraint(equalTo: card.rightAnchor, constant: -.mainPadding),
            scoreLabel.centerYAnchor.constraint(equalTo: card.centerYAnchor),
        ])
    }
    
    func configure(indexPath: IndexPath, team: Team) {
        self.team = team
        
        indexlabel.text = String(indexPath.row + 1)
        nameLabel.text = team.name
        winsLabel.text = "Победы \(team.numberHomeWin ?? 0) - \(team.numberGuestWin ?? 0)"
        scoreLabel.text = "\(String(team.allHomeScore ?? 0)) - \(String(team.allGuestScore ?? 0))"
    }
    
    @objc func handleCardTouchUpInside() {
        guard let team else { return }
        
        delegate?.pressCard(team: team)
    }
}
