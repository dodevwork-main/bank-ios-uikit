//
//  TeamMainCell.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 17.06.2024.
//

import Foundation
import UIKit

final class TeamMainCell: UITableViewCell {
    
    static let identifier = "TeamMainCell"
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: .fontSize * 1.5)
        
        return label
    }()
    
    private lazy var logoImageView: UIImageView = {
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
        contentView.addSubview(nameLabel)
        contentView.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .mainPadding),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: .mainPadding),
            logoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -.mainPadding),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.45),
            logoImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.45),
        ])
    }
    
    func configure(team: Team) {
        nameLabel.text = team.name
    }
}
