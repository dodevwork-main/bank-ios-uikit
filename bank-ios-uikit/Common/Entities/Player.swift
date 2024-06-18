//
//  Player.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 13.06.2024.
//

import Foundation

struct Player: Decodable {
    let id: String
    let teamId: String
    let name: String
    let surName: String
    let number: Int
    let hieght: Int
    let weight: Int
    let position: String
    let dateBirth: String
    let titul: String?
    
    // Relations
    var team: Team?
}

enum PlayerPosition: String {
    case guardPosition = "guard"
    case forward = "forward"
    case center = "center"
}
