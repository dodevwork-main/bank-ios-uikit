//
//  AuthDto.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 04.06.2024.
//

import Foundation

protocol AuthDtoProtocol {
    var username: String? { get set }
    var password: String? { get set }
    var pinCode: String? { get set }
}

struct AuthDto: AuthDtoProtocol {
    var username: String?
    var password: String?
    var pinCode: String?
}
