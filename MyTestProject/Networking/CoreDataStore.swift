//
//  CoreDataStore.swift
//  MyTestProject
//
//  Created by Max Stovolos on 12/15/22.
//

import Foundation
import CoreData

// MARK: - Protocol

protocol CoreDataStorePresenter {
    var context: NSManagedObjectContext { get }
    
    func saveContext()
}

// MARK: - CoreDataStore

class CoreDataStore: CoreDataStorePresenter {
    
    // MARK: - Core Data stack
    
    lazy var context: NSManagedObjectContext = {
        persistentContainer.viewContext
    }()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MyTestProject")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchRequest() -> [Recipe] {
        let fetchRequest: NSFetchRequest<LikedFoodCD> = LikedFoodCD.fetchRequest()
        
        do {
            let objects = try context.fetch(fetchRequest)
            let likedRecipies = objects.map(Recipe.init(recipe:))
            
        } catch let error {
            print(error)
        }
    }
}
