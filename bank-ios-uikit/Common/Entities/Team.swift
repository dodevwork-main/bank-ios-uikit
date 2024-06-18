//
//  Team.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 13.06.2024.
//

import Foundation

struct Team: Decodable {
    let id: String
    let picture: String
    let name: String
    let playerIds: [String]
    
    // Custom
    var numberHomeWin: Int?
    var numberGuestWin: Int?
    var allHomeScore: Int?
    var allGuestScore: Int?
    var nextGame: Date?
    
    // Relations
    var players: [Player]?
}
