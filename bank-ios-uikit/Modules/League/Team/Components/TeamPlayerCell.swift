//
//  TeamPlayerCell.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 17.06.2024.
//

import Foundation
import UIKit

protocol TeamPlayerCellDelegate: AnyObject {
    func pressCard(player: Player)
}

final class TeamPlayerCell: UITableViewCell {
    
    static let identifier = "TeamPlayerCell"
    
    weak var delegate: TeamPlayerCellDelegate?
    
    private var player: Player?
    
    private lazy var card: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = .mainPadding * 0.5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(handleCardTouchUpInside), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var forwardImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.forward"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .lightGray
        
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
        contentView.addSubview(card)
        
        card.addSubview(numberLabel)
        card.addSubview(fullNameLabel)
        card.addSubview(forwardImageView)
        
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .mainPadding * 0.5),
            card.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            card.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            card.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            numberLabel.leftAnchor.constraint(equalTo: card.leftAnchor, constant: .mainPadding),
            numberLabel.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            
            fullNameLabel.leftAnchor.constraint(equalTo: card.leftAnchor, constant: .mainPadding * 3),
            fullNameLabel.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            
            forwardImageView.rightAnchor.constraint(equalTo: card.rightAnchor, constant: -.mainPadding),
            forwardImageView.centerYAnchor.constraint(equalTo: card.centerYAnchor),
        ])
    }
    
    func configure(player: Player) {
        self.player = player
        
        numberLabel.text = "\(player.number):"
        fullNameLabel.text = "\(player.surName) \(player.name)"
    }
    
    @objc func handleCardTouchUpInside() {
        guard let player else { return }
        
        delegate?.pressCard(player: player)
    }
}
