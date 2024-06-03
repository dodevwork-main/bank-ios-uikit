//
//  User.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 30.05.2024.
//

import Foundation

struct User: Decodable {
    let id: String
    let name: String
    let lastName: String
    let phoneNumber: String
    let email: String
}
