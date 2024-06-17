//
//  LeagueCalendarCell.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 15.06.2024.
//

import Foundation
import UIKit

final class LeagueCalendarCell: UITableViewCell {
    
    static let identifier = "LeagueCalendarCell"
    
    private var calendar: CalendarEntity?
    
    private lazy var card: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = .mainPadding * 0.5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        
        return button
    }()
    
    private lazy var startDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var homeScoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var guestScoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var nameHomeTeamLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .caption1)
        
        return label
    }()
    
    private lazy var nameGuestTeamLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .caption1)
        
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .caption1)
        
        return label
    }()
    
    private lazy var dividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    private lazy var logoHomeTeamView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "shippingbox"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private lazy var logoGuestTeamView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "character.textbox.ko"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
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
        
        card.addSubview(startDateLabel)
        card.addSubview(homeScoreLabel)
        card.addSubview(guestScoreLabel)
        card.addSubview(nameHomeTeamLabel)
        card.addSubview(logoHomeTeamView)
        card.addSubview(nameGuestTeamLabel)
        card.addSubview(logoGuestTeamView)
        card.addSubview(dividerView)
        card.addSubview(statusLabel)
        
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .mainPadding),
            card.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            card.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            card.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            startDateLabel.topAnchor.constraint(equalTo: card.topAnchor, constant: .mainPadding * 0.5),
            startDateLabel.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            
            dividerView.topAnchor.constraint(equalTo: startDateLabel.bottomAnchor, constant: .mainPadding * 0.5),
            dividerView.heightAnchor.constraint(equalTo: homeScoreLabel.heightAnchor, multiplier: 3),
            dividerView.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            dividerView.widthAnchor.constraint(equalToConstant: 1),
            
            homeScoreLabel.rightAnchor.constraint(equalTo: dividerView.leftAnchor, constant: -.mainPadding * 0.5),
            homeScoreLabel.centerYAnchor.constraint(equalTo: dividerView.centerYAnchor),
            
            guestScoreLabel.leftAnchor.constraint(equalTo: dividerView.rightAnchor, constant: .mainPadding * 0.5),
            guestScoreLabel.centerYAnchor.constraint(equalTo: dividerView.centerYAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: .mainPadding),
            statusLabel.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -.mainPadding * 0.5),
            statusLabel.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            
            logoHomeTeamView.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            logoHomeTeamView.leftAnchor.constraint(equalTo: card.leftAnchor, constant: .mainPadding),
            logoHomeTeamView.heightAnchor.constraint(equalTo: dividerView.heightAnchor),
            logoHomeTeamView.widthAnchor.constraint(equalTo: dividerView.heightAnchor),
            
            nameHomeTeamLabel.topAnchor.constraint(equalTo: logoHomeTeamView.bottomAnchor, constant: .mainPadding * 0.5),
            nameHomeTeamLabel.centerXAnchor.constraint(equalTo: logoHomeTeamView.centerXAnchor),
            
            logoGuestTeamView.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            logoGuestTeamView.rightAnchor.constraint(equalTo: card.rightAnchor, constant: -.mainPadding),
            logoGuestTeamView.heightAnchor.constraint(equalTo: dividerView.heightAnchor),
            logoGuestTeamView.widthAnchor.constraint(equalTo: dividerView.heightAnchor),
            
            nameGuestTeamLabel.topAnchor.constraint(equalTo: logoGuestTeamView.bottomAnchor, constant: .mainPadding * 0.5),
            nameGuestTeamLabel.centerXAnchor.constraint(equalTo: logoGuestTeamView.centerXAnchor),
        ])
    }
    
    func configure(calendar: CalendarEntity) {
        self.calendar = calendar
        
        guard let startDate = MainDate.apiFormatter.date(from: calendar.startDate),
            let endDate = MainDate.apiFormatter.date(from: calendar.endDate),
            let homeTeam = calendar.homeTeam,
            let guestTeam = calendar.guestTeam else { return }
        
        startDateLabel.text = MainDate.dateTimeFormatter.string(from: startDate)
        homeScoreLabel.text = String(calendar.homeScore)
        guestScoreLabel.text = String(calendar.guestScore)
        nameHomeTeamLabel.text = homeTeam.name
        nameGuestTeamLabel.text = guestTeam.name
        
        let nowDate = Date()
        
        if nowDate > startDate, nowDate > endDate {
            statusLabel.text = "Завершена"
        } else if nowDate > startDate, nowDate < endDate {
            statusLabel.text = "Идет"
        } else {
            statusLabel.text = "Запланирована"
        }
    }
}
