//
//  MainDate.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 15.06.2024.
//

import Foundation

final class MainDate {
    static let calendar = Calendar.current
    static let timeZone = TimeZone.current
    static let locale = Locale(identifier: "ru-RU")
    
    static let apiFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd-HH:mm"
        dateFormatter.timeZone = timeZone
        dateFormatter.locale = locale
        
        return dateFormatter
    }()
    
    static let apiDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = timeZone
        dateFormatter.locale = locale
        
        return dateFormatter
    }()
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateFormatter.timeZone = timeZone
        dateFormatter.locale = locale
        
        return dateFormatter
    }()
    
    static let dateTimeFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        dateFormatter.timeZone = timeZone
        dateFormatter.locale = locale
        
        return dateFormatter
    }()
    
 
    
    func getDateWithZeroTime(string: String) -> Date? {
        guard let date = MainDate.apiFormatter.date(from: string) else { return nil }
        
        return getDateWithZeroTime(date: date)
    }
    
    func getDateWithZeroTime(date: Date) -> Date? {
        MainDate.calendar.date(bySettingHour: 0, minute: 0, second: 0, of: date)
    }
}
