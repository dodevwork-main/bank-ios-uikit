//
//  MainButton.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 30.05.2024.
//

import UIKit

class MainButton: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                backgroundColor = .prymaryMain
                setTitleColor(.black, for: .normal)
            } else {
                backgroundColor = .lightGray
                setTitleColor(.white, for: .normal)
            }
        }
    }
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.layer.cornerRadius = 10
        self.isEnabled = true
        
        
        self.addSubview(self.title)
        
        NSLayoutConstraint.activate([
            self.title.topAnchor.constraint(equalTo: self.topAnchor, constant: .mainPadding),
            self.title.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -.mainPadding),
            self.title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(nil, for: state)
        
        self.title.text = title
    }
}
