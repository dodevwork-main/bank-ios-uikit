//
//  LottieViewController.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 06.06.2024.
//

import Foundation
import UIKit
import Lottie

protocol LottieViewControllerInput: AnyObject {}

protocol LottieViewControllerOutput: AnyObject {
    func getCurrentUser() -> CurrentUser?
}

final class LottieViewController: UIViewController {
    
    var output: LottieViewControllerOutput?
    
    private lazy var animationView: LottieAnimationView = {
        let animation = LottieAnimationView(name: "lottie-animation")
        animation.translatesAutoresizingMaskIntoConstraints = false
        animation.play()
        animation.loopMode = .loop
        
        animation.layer.cornerRadius = .mainPadding
        animation.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        animation.backgroundColor = .white
        
        return animation
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        configeViewComponents()
    }
    
    private func configeViewComponents() {
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            animationView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            animationView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            animationView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension LottieViewController: LottieViewControllerInput {}
