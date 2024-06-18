//
//  PlayerMainCell.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 17.06.2024.
//

import Foundation
import UIKit

final class PlayerMainCell: UITableViewCell {
    
    static let identifier = "PlayerMainCell"
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: .fontSize * 1.3)
        
        return label
    }()
    
    private lazy var surNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: .fontSize * 1.3)
        
        return label
    }()
    
    private lazy var teamNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        
        return label
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person.crop.square.fill"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = .mainPadding * 0.5
        imageView.tintColor = .blue
        
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
        contentView.addSubview(nameLabel)
        contentView.addSubview(surNameLabel)
        contentView.addSubview(teamNameLabel)
        contentView.addSubview(profileImageView)
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .mainPadding),
            profileImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -.mainPadding),
            profileImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            profileImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            profileImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            
            surNameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: .mainPadding),
            surNameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: .mainPadding * 0.25),
            
            nameLabel.topAnchor.constraint(equalTo: surNameLabel.bottomAnchor),
            nameLabel.leftAnchor.constraint(equalTo: surNameLabel.leftAnchor),
            
            teamNameLabel.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: -.mainPadding),
            teamNameLabel.leftAnchor.constraint(equalTo: surNameLabel.leftAnchor),
        ])
    }
    
    func configure(player: Player) {
        nameLabel.text = player.name
        surNameLabel.text = player.surName
        teamNameLabel.text = player.team?.name
    }
}
