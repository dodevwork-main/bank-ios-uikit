//
//  PinCodeInteractor.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 31.05.2024.
//

import Foundation

protocol PinCodeInteractorInput: AnyObject {
    func signUp(authDto: AuthDtoProtocol)
}
protocol PinCodeInteractorOutput: AnyObject {
    func didSignUp(newUser: User)
}

final class PinCodeInteractor {
    weak var output: PinCodeInteractorOutput?
}

extension PinCodeInteractor: PinCodeInteractorInput {
    func signUp(authDto: AuthDtoProtocol) {
        guard let url = URL(string: API.getLoginUrl()) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                print(error ?? "")
                return
            }

            do {
                let newUser = try JSONDecoder().decode(User.self, from: data)
                
                self?.output?.didSignUp(newUser: newUser)
            } catch let error {
                print(error)
                return
            }
        }
        
        task.resume()
    }
}
