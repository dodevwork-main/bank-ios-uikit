//
//  CalendarEntity.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 13.06.2024.
//

import Foundation

struct CalendarEntity: Decodable {
    let homeTeamId: String
    let guestTeamId: String
    let startDate: String
    let homeScore: Int
    let guestScore: Int
    let endDate: String
    
    // Relations
    var homeTeam: Team?
    var guestTeam: Team?
}
