//
//  StandingsInteractor.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 09.06.2024.
//

import Foundation

protocol StandingsInteractorInput: AnyObject {
    func getInitialData(completionHandler: @escaping ((dateCalendars: DateCalendars, teams: [Team])) -> Void)
}

protocol StandingsInteractorOutput: AnyObject {}

final class StandingsInteractor {
    weak var output: StandingsInteractorOutput?
    
    private func parceTeams(teams: [Team], players: [Player]) -> [Team] {
        return teams.map {team in
            var newTeam = team
            newTeam.players = players
                .filter { team.playerIds.contains($0.id) }
                .map { player in
                    var newPlayer = player
                    newPlayer.team = newTeam
                    
                    return newPlayer
                }
            
            return newTeam
        }
    }
    
    // TODO: set nextGame from calendars to teams
    private func calculateTeams(teams: [Team], calendars: [CalendarEntity]) -> [Team] {
        var newTeams = teams
        
        calendars.forEach { calendar in
            
            guard let startDate = MainDate.apiFormatter.date(from: calendar.startDate),
                    startDate <= Date() else { return }
            
            guard let homeIndex = newTeams.firstIndex(where: {$0.id == calendar.homeTeamId}),
                    let guestIndex = newTeams.firstIndex(where: {$0.id == calendar.guestTeamId}) else { return }
            
            var homeTeam = newTeams[homeIndex]
            var guestTeam = newTeams[guestIndex]
            
            // Increase values
            if calendar.homeScore > calendar.guestScore {
                homeTeam.numberHomeWin = 1 + (homeTeam.numberHomeWin ?? 0)
                
            } else if calendar.homeScore < calendar.guestScore {
                guestTeam.numberGuestWin = 1 + (guestTeam.numberGuestWin ?? 0)
                
            } else {
                homeTeam.numberHomeWin = 1 + (homeTeam.numberHomeWin ?? 0)
                guestTeam.numberGuestWin = 1 + (guestTeam.numberGuestWin ?? 0)
            }
            
            homeTeam.allHomeScore = calendar.homeScore + (homeTeam.allHomeScore ?? 0)
            guestTeam.allGuestScore = calendar.guestScore + (guestTeam.allGuestScore ?? 0)
            
            newTeams[homeIndex] = homeTeam
            newTeams[guestIndex] = guestTeam
        }
        
        return newTeams
    }
    
    private func getDateCalendars(calendars: [CalendarEntity], teams: [Team]) -> DateCalendars {
        var dateCalendars: DateCalendars = [:]
        
        calendars.forEach {calendar in
            var newCalendar = calendar
            
            guard let startDate = MainDate().getDateWithZeroTime(string: calendar.startDate) else { return }
            
            newCalendar.homeTeam = teams.first { $0.id == calendar.homeTeamId }
            newCalendar.guestTeam = teams.first { $0.id == calendar.guestTeamId }
            
            if dateCalendars[startDate] == nil {
                dateCalendars[startDate] = [newCalendar]
            } else {
                dateCalendars[startDate]?.append(newCalendar)
            }
        }
        
        return dateCalendars
    }
}

extension StandingsInteractor: StandingsInteractorInput {
    func getInitialData(completionHandler: @escaping (((dateCalendars: DateCalendars, teams: [Team]))) -> Void) {
        let dispatchGroup = DispatchGroup()
        var calendars: [CalendarEntity]?
        var teams: [Team]?
        var players: [Player]?
        
        // Calendars
        dispatchGroup.enter()
        guard let url = URL(string: API.mainUrl.restCalendar) else { return }
    
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print(error ?? "")
                return
            }

            do {
                calendars = try JSONDecoder().decode([CalendarEntity].self, from: data)
            } catch let error {
                print(error)
            }
            
            dispatchGroup.leave()
        }.resume()
        
        // Teams
        dispatchGroup.enter()
        guard let url = URL(string: API.mainUrl.restTeams) else { return }
    
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print(error ?? "")
                return
            }

            do {
                teams = try JSONDecoder().decode([Team].self, from: data)
            } catch let error {
                print(error)
            }
            
            dispatchGroup.leave()
        }.resume()
        
        // Players
        dispatchGroup.enter()
        guard let url = URL(string: API.mainUrl.restPlayers) else { return }
    
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print(error ?? "")
                return
            }

            do {
                players = try JSONDecoder().decode([Player].self, from: data)
            } catch let error {
                print(error)
            }
            
            dispatchGroup.leave()
        }.resume()
        
        
        dispatchGroup.notify(queue: .main) {
            guard let calendars, let teams, let players else { return }
            
            let parceTeams = self.parceTeams(teams: teams, players: players)
            let calculatedTeams = self.calculateTeams(teams: parceTeams, calendars: calendars)
            let dateCalendars = self.getDateCalendars(calendars: calendars, teams: parceTeams)
            
            completionHandler((dateCalendars, calculatedTeams))
        }
    }
}
