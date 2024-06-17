//
//  Loader.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 14.06.2024.
//

import Foundation
import UIKit

final class Loader: UIView {
    
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.center = center
        spinner.color = .gray
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        
        return spinner
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
        addSubview(spinner)
    }
    
    func start() {
        spinner.startAnimating()
    }
    
    func stop() {
        spinner.stopAnimating()
    }
}
