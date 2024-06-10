//
//  CoreDataManager.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 03.06.2024.
//

import CoreData
import UIKit

protocol CoreDataManagerCurrentUser {
    func createCurrentUser(user: User, pinCode: String) -> CurrentUser?
    func getCurrentUsers() -> [CurrentUser]
    func getCurrentUser(with pinCode: String) -> CurrentUser?
    func haveAnyCurrentUsers() -> Bool
    func deleteAllCurrentUsers() -> [CurrentUser]
    func updateCurrentUser(id: String, email: String?, phoneNumber: String?) -> CurrentUser?
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
    
    func createCurrentUser(user: User, pinCode: String) -> CurrentUser? {
        guard let entity = NSEntityDescription.entity(forEntityName: CurrentUser.name, in: context) else { return nil }
        
        guard getCurrentUsers().isEmpty else { return nil }
        
        let currentUser = CurrentUser(entity: entity, insertInto: context)
        currentUser.id = user.id
        currentUser.name = user.name
        currentUser.lastName = user.lastName
        currentUser.email = user.email
        currentUser.phoneNumber = user.phoneNumber
        currentUser.pinCode = pinCode
        
        appDelegate.saveContext()
        
        return currentUser
    }
    
    func getCurrentUsers() -> [CurrentUser] {
        let fetchRequset = NSFetchRequest<NSFetchRequestResult>(entityName: CurrentUser.name)
        
        return (try? context.fetch(fetchRequset) as? [CurrentUser]) ?? []
    }
    
    func getCurrentUser(with pinCode: String) -> CurrentUser? {
        let users = getCurrentUsers()
        
        return users.first(where: {$0.pinCode == pinCode})
    }
    
    func haveAnyCurrentUsers() -> Bool {
        let users = getCurrentUsers()
        print("users", users.map({ $0.pinCode ?? "nil" }))
        
        return !users.isEmpty
    }
    
    func updateCurrentUser(id: String, email: String?, phoneNumber: String?) -> CurrentUser? {
        let users = getCurrentUsers()
        
        guard let currentUser = users.first(where: { $0.id == id }) else { return nil }
        
        if let email {
            currentUser.email = email
        }
        
        if let phoneNumber {
            currentUser.phoneNumber = phoneNumber
        }
        
        appDelegate.saveContext()
        
        return currentUser
    }
    
    func deleteAllCurrentUsers() -> [CurrentUser] {
        let users = getCurrentUsers()
        users.forEach { context.delete($0) }
        
        appDelegate.saveContext()
        
        return users
    }
}
