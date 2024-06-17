//
//  PlayerStatisticCell.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 17.06.2024.
//

import Foundation
import UIKit

final class PlayerStatisticCell: UITableViewCell {
    
    static let identifier = "PlayerStatisticCell"
    
    private lazy var card: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = .mainPadding * 0.5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        
        return button
    }()
    
    private lazy var captionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        
        return label
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
        
        card.addSubview(captionLabel)
        card.addSubview(valueLabel)
        
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .mainPadding * 0.5),
            card.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            card.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            card.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            captionLabel.leftAnchor.constraint(equalTo: card.leftAnchor, constant: .mainPadding),
            captionLabel.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            
            valueLabel.rightAnchor.constraint(equalTo: card.rightAnchor, constant: -.mainPadding),
            valueLabel.centerYAnchor.constraint(equalTo: card.centerYAnchor),
        ])
    }
    
    func configure(index: Int, player: Player) {
        switch index {
        case 0:
            captionLabel.text = "Дата рождения:"
            
            if let dateBirth = MainDate.apiDateFormatter.date(from: player.dateBirth) {
                valueLabel.text = MainDate.dateFormatter.string(from: dateBirth)
            }
        case 1:
            captionLabel.text = "Рост:"
            valueLabel.text = "\(player.hieght) см"
        case 2:
            captionLabel.text = "Вес:"
            valueLabel.text = "\(player.weight) кг"
        case 3:
            captionLabel.text = "Позиция:"
            switch PlayerPosition(rawValue: player.position) {
            case .center:
                valueLabel.text = "Центр"
            case .guardPosition:
                valueLabel.text = "Защитник"
            case .forward:
                valueLabel.text = "Нападающий"
            default:
                valueLabel.text = ""
            }
        case 4:
            captionLabel.text = "Игровой номер:"
            valueLabel.text = "\(player.number)"
        case 5:
            captionLabel.text = "Звание:"
            valueLabel.text = player.titul ?? "-"
        case 6:
            captionLabel.text = "Ближайшая игра"
            valueLabel.text = "-"
            if let nextGame = player.team?.nextGame {
                valueLabel.text = MainDate.dateTimeFormatter.string(from: nextGame)
            }
        default:
            captionLabel.text = ""
        }
    }
}
