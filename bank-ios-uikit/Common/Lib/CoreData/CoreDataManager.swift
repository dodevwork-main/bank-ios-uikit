//
//  CoreDataManager.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 03.06.2024.
//

import CoreData
import UIKit

protocol CoreDataManagerCurrentUser {
    func createCurrentUser(user: User, authDto: AuthDtoProtocol) -> CurrentUser?
    func getCurrentUser() -> CurrentUser?
    func deleteCurrentUser() -> CurrentUser?
    func updateCurrentUser(email: String?, 
                           phoneNumber: String?,
                           pinCode: String?,
                           username: String?,
                           password: String?) -> CurrentUser?
}

final class CoreDataManager: NSObject {
    
    static let shared = CoreDataManager()
    private override init() {}
    
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    private var context: NSManagedObjectContext {
        appDelegate.persistentContainer.viewContext
    }
}

extension CoreDataManager: CoreDataManagerCurrentUser {
    
    func createCurrentUser(user: User, authDto: AuthDtoProtocol) -> CurrentUser? {
        // Check has CurrentUser
        guard getCurrentUser() == nil else { return nil }
        
        guard let entity = NSEntityDescription.entity(forEntityName: CurrentUser.name, in: context) else { return nil }
        
        let currentUser = CurrentUser(entity: entity, insertInto: context)
        currentUser.id = user.id
        currentUser.name = user.name
        currentUser.lastName = user.lastName
        currentUser.email = user.email
        currentUser.phoneNumber = user.phoneNumber
        
        currentUser.pinCode = authDto.pinCode
        currentUser.password = authDto.password
        currentUser.username = authDto.username
        
        appDelegate.saveContext()
        
        return currentUser
    }
    
    func getCurrentUser() -> CurrentUser? {
        let fetchRequset = NSFetchRequest<NSFetchRequestResult>(entityName: CurrentUser.name)
        
        return (try? context.fetch(fetchRequset) as? [CurrentUser])?.first
    }
    
    func updateCurrentUser(email: String?,
                           phoneNumber: String?,
                           pinCode: String?,
                           username: String?,
                           password: String?) -> CurrentUser? {
        guard let currentUser = getCurrentUser() else { return nil }
        
        currentUser.email = email
        currentUser.phoneNumber = phoneNumber
        currentUser.pinCode = pinCode
        currentUser.password = password
        currentUser.username = username
        
        appDelegate.saveContext()
        
        return currentUser
    }
    
    func deleteCurrentUser() -> CurrentUser? {
        guard let currentUser = getCurrentUser() else { return nil }
        
        context.delete(currentUser)
        appDelegate.saveContext()
        
        return currentUser
    }
}
