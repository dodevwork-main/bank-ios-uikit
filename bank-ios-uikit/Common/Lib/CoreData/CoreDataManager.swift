//
//  CoreDataManager.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 03.06.2024.
//

import CoreData
import UIKit

final class CoreDataManager: NSObject {
    static let shared = CoreDataManager()
    private override init() {}
    
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    private var context: NSManagedObjectContext {
        appDelegate.persistentContainer.viewContext
    }
    
    func createCurrentUser(user: User, pinCode: String) {
        guard let entity = NSEntityDescription.entity(forEntityName: "CurrentUser", in: context) else {
            return
        }
        let currentUser = CurrentUser(entity: entity, insertInto: context)
        currentUser.id = user.id
        currentUser.name = user.name
        currentUser.lastName = user.lastName
        currentUser.email = user.email
        currentUser.phoneNumber = user.phoneNumber
        currentUser.pinCode = pinCode
        
        appDelegate.saveContext()
    }
    
    func fetchCurrentUser(pinCode: String) -> CurrentUser? {
        let fetchRequset = NSFetchRequest<NSFetchRequestResult>(entityName: "CurrentUser")
//        fetchRequset.predicate = NSPredicate(format: "pinCode == %@", pinCode)
        do {
            let users = try? context.fetch(fetchRequset) as? [CurrentUser]
            return users?.first(where: {$0.pinCode == pinCode})
        }
    }
}
