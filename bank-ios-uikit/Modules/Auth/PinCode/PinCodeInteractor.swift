//
//  PinCodeInteractor.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 31.05.2024.
//

import Foundation

protocol PinCodeInteractorProtocol {
    var presenter: PinCodePresenter? { get set }
    
    func login()
}

final class PinCodeInteractor: PinCodeInteractorProtocol {

    var presenter: PinCodePresenter?
    
    func login() {
        print("foo")
//        guard let url = URL(string: "") else { return }
//
//        let task = URLSession.shared.dataTask(with: url) {[weak self]data, _, error in
//            guard let data = data, error != nil else {
//                return
//            }
//
//            do {
//                let response
//            } catch {
//
//            }
//        }
        
//        presenter?.interactorDidLogin(with: User(id: "1"))
    }
}
