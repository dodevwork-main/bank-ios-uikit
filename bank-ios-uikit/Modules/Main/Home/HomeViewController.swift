//
//  HomeViewController.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 03.06.2024.
//

import Foundation
import UIKit

protocol HomeViewControllerInput: AnyObject {}

protocol HomeViewControllerOutput: AnyObject {
    func getCurrentUser() -> CurrentUser?
    func pressSettingsButton()
    func pressLeagueButton()
    func pressLogoutButton()
}

final class HomeViewController: UIViewController {
    
    var output: HomeViewControllerOutput?
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: .fontSize * 1.3)
        
        if let currentUser = output?.getCurrentUser() {
            label.text = "\(currentUser.name ?? "") \(currentUser.lastName ?? "")."
        }
        
        return label
    }()
    
    private lazy var phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        
        if let phoneNumber = output?.getCurrentUser()?.phoneNumber {
            label.text = phoneNumber
        }
        
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        
        if let email = output?.getCurrentUser()?.email {
            label.text = email
        }
        
        return label
    }()

    private lazy var logoutButtonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Выйти", for: .normal)
        button.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
        button.tintColor = .black
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleLogoutButtonTouchUpOInside), for: .touchUpInside)
        button.configuration = .plain()
        button.configuration?.imagePlacement = .trailing
        button.configuration?.imagePadding = .mainPadding * 0.5
        
        view.addSubview(button)
  
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.rightAnchor.constraint(equalTo: view.rightAnchor),
            button.leftAnchor.constraint(equalTo: view.leftAnchor),
        ])
        
        return view
    }()
    
    private lazy var cardsCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.width / 3, height: MainCardCollectionCell.height)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.contentInset = UIEdgeInsets(top: 0, left: .mainPadding, bottom: 0, right: .mainPadding)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.frame = view.bounds
        collection.register(MainCardCollectionCell.self, forCellWithReuseIdentifier: MainCardCollectionCell.identifier)
        
        return collection
    }()
    
    private lazy var settingsLabelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Найстройки"
        label.textColor = .systemGray
        label.font = .boldSystemFont(ofSize: .fontSize)
        
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: .mainPadding),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -.mainPadding),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: .mainPadding),
        ])
        
        return view
    }()
    
    private lazy var lines: MainHomeLines = {
        let lines = MainHomeLines()
        lines.translatesAutoresizingMaskIntoConstraints = false
        lines.delegate = self
        
        return lines
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = .mainPadding
        view.backgroundColor = .white
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black

        configeViewComponents()
    }
    
    private func configeViewComponents() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(phoneNumberLabel)
        contentView.addSubview(emailLabel)
        contentView.addSubview(logoutButtonView)
        contentView.addSubview(cardsCollection)
        contentView.addSubview(settingsLabelView)
        contentView.addSubview(lines)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            fullNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .mainPadding),
            fullNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: .mainPadding),
            
            phoneNumberLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: .mainPadding * 0.5),
            phoneNumberLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: .mainPadding),
            
            emailLabel.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor),
            emailLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: .mainPadding),
            
            logoutButtonView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .mainPadding),
            logoutButtonView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -.mainPadding),
            logoutButtonView.bottomAnchor.constraint(equalTo: emailLabel.bottomAnchor),
            
            cardsCollection.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: .mainPadding * 0.5),
            cardsCollection.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            cardsCollection.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            cardsCollection.heightAnchor.constraint(equalToConstant: MainCardCollectionCell.height),
            
            settingsLabelView.topAnchor.constraint(equalTo: cardsCollection.bottomAnchor, constant: .mainPadding),
            settingsLabelView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            settingsLabelView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            lines.topAnchor.constraint(equalTo: settingsLabelView.bottomAnchor),
            lines.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            lines.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            lines.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    @objc func handleLogoutButtonTouchUpOInside() {
        output?.pressLogoutButton()
    }
}

extension HomeViewController: HomeViewControllerInput {}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        MainCardCollectionCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCardCollectionCell.identifier, for: indexPath) as! MainCardCollectionCell
        cell.configure(indexPath: indexPath)
        
        return cell
    }
}


extension HomeViewController: MainHomeLinesDelegate {
    func pressSettingsButton() {
        output?.pressSettingsButton()
    }
    
    func pressLeagueButton() {
        output?.pressLeagueButton()
    }
}
