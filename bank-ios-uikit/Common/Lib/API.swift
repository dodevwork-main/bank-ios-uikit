//
//  API.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 03.06.2024.
//

import Foundation

enum API: String {
    case mainUrl = "http://localhost:3000"
    
    var restLogin: String { "\(API.mainUrl.rawValue)/rest/login" }
    var restCalendar: String { "\(API.mainUrl.rawValue)/rest/calendar" }
    var restTeams: String { "\(API.mainUrl.rawValue)/rest/teams" }
    var restPlayers: String { "\(API.mainUrl.rawValue)/rest/players" }
}
