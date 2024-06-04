//
//  CurrentUser+CoreDataProperties.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 03.06.2024.
//
//

import Foundation
import CoreData

@objc(CurrentUser)
class CurrentUser: NSManagedObject {}

extension CurrentUser {

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var lastName: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var email: String?
    @NSManaged public var pinCode: String?

}

extension CurrentUser : Identifiable {

}
