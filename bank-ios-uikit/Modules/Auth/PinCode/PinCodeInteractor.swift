//
//  PinCodeInteractor.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 31.05.2024.
//

import Foundation

protocol PinCodeInteractorProtocol {
    var presenter: PinCodePresenter? { get set }
    
    func savePinCode(_ pinCodeValue: String)
    
    func login()
}

final class PinCodeInteractor: PinCodeInteractorProtocol {

    var presenter: PinCodePresenter?
    
    func savePinCode(_ pinCodeValue: String) {
        print("Save in CoreData PinCode - ", pinCodeValue)
    }
    
    func saveCurrentUser(_ currentUser: User) {
        print("Save in CoreData User - ", currentUser)
    }
    
    func login() {
        guard let url = URL(string: API.getLoginUrl()) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                print(error ?? "")
                return
            }

            do {
                let currentUser = try JSONDecoder().decode(User.self, from: data)
                
                self?.saveCurrentUser(currentUser)
                self?.presenter?.interactorDidLogin(with: currentUser)
                
            } catch let error {
                print(error)
                return
            }
        }
        
        task.resume()
    }
}
