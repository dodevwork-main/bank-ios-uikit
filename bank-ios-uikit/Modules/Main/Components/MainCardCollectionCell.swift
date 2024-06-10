//
//  MainCardCollectionCell.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 07.06.2024.
//

import Foundation
import UIKit

final class MainCardCollectionCell: UICollectionViewCell {
    
    static let identifier = "MainCardCollectionCell"
    static let height: CGFloat = 80
    static let count: Int = 5
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2

        return label
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
        self.contentView.backgroundColor = .lightGray
        self.contentView.layer.cornerRadius = 10
        self.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -.mainPadding * 0.5),
            label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: .mainPadding * 0.5),
            label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -.mainPadding)
        ])
    }
    
    func configure(indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            label.text = "Открыть продукт"
        case 1:
            label.text = "Скидки для вас"
        case 2:
            label.text = "Баланс #всесразу"
        case 3:
            label.text = "Балдей"
        case 4:
            label.text = "Кайфуй"
        default:
            label.text = nil
        }
    }
}

