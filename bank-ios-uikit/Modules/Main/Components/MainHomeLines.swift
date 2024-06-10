//
//  MainHomeLines.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 07.06.2024.
//

import Foundation
import UIKit

protocol MainHomeLinesDelegate: AnyObject {
    func pressSettingsButton()
    func pressLeagueButton()
}

final class MainHomeLines: UIView {
    
    private let count: Int = 20
    
    weak var delegate: MainHomeLinesDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        
        var buttonTopAnchor = self.topAnchor
        
        for i in 1...count {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.tintColor = .black
            
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            
            let divider = UIView()
            divider.translatesAutoresizingMaskIntoConstraints = false
            divider.backgroundColor = .systemGray5
            
            switch i {
            case 1:
                label.text = "Персональные данные"
                imageView.image = UIImage(systemName: "person")
            case 2:
                label.text = "Переводы по номеру телефона"
                imageView.image = UIImage(systemName: "iphone.and.arrow.forward")
            case 3:
                label.text = "Информация о транзакциях"
                imageView.image = UIImage(systemName: "doc.plaintext")
            case 4:
                label.text = "Подтверждение операций"
                imageView.image = UIImage(systemName: "text.badge.checkmark.rtl")
            case 5:
                label.text = "Настройки входа"
                imageView.image = UIImage(systemName: "keyboard")
                button.addTarget(self, action: #selector(handleSettingsButtonTouchUpInside), for: .touchUpInside)
            case 6:
                label.text = "Райффайзен Банк Лига 3x3"
                imageView.image = UIImage(systemName: "basketball.fill")
                button.addTarget(self, action: #selector(handleLeagueButtonTouchUpInside), for: .touchUpInside)
            default:
                label.text = "Lorem ipsum"
                imageView.image = UIImage(systemName: "square")
            }
            
            self.addSubview(button)
            
            button.addSubview(imageView)
            button.addSubview(label)
            button.addSubview(divider)
            
            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: buttonTopAnchor),
                button.leftAnchor.constraint(equalTo: self.leftAnchor),
                button.rightAnchor.constraint(equalTo: self.rightAnchor),
                
                imageView.topAnchor.constraint(equalTo: button.topAnchor, constant: .mainPadding * 1.25),
                imageView.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -.mainPadding * 1.25),
                imageView.rightAnchor.constraint(equalTo: button.leftAnchor, constant: .mainPadding * 3),
                
                label.centerYAnchor.constraint(equalTo: button.centerYAnchor),
                label.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: .mainPadding * 0.5),
                
                divider.heightAnchor.constraint(equalToConstant: 1),
                divider.bottomAnchor.constraint(equalTo: button.bottomAnchor),
                divider.leftAnchor.constraint(equalTo: button.leftAnchor),
                divider.rightAnchor.constraint(equalTo: button.rightAnchor),
            ])
            
            buttonTopAnchor = button.bottomAnchor
            
            // Set BottomAnchor for ScrollView
            if i == count {
                button.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
                divider.isHidden = true
            }
        }
    }
    
    @objc func handleSettingsButtonTouchUpInside() {
        delegate?.pressSettingsButton()
    }
    
    @objc func handleLeagueButtonTouchUpInside() {
        delegate?.pressLeagueButton()
    }
}
