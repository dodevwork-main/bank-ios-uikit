//
//  API.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 03.06.2024.
//

import Foundation

final class API {
    static let API_URL = "http://localhost:3000"
    
    static func getLoginUrl() -> String {
        return "\(API.API_URL)/rest/login"
    }

}
