//
//  CoreDataStore.swift
//  MyTestProject
//
//  Created by Max Stovolos on 12/15/22.
//

import Foundation
import CoreData

// MARK: - Protocol

protocol CoreDataStoreProtocol {
    var context: NSManagedObjectContext { get }
    
    func saveContext()
    func fetchRecipes(completion: (([LikedFoodCD]) -> Void))
    func deleteRecipe(id: UUID)
}

// MARK: - CoreDataStore

class CoreDataStore: CoreDataStoreProtocol {
    
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
    
    func fetchRecipes(completion: (([LikedFoodCD]) -> Void)) {
        let fetchRequest: NSFetchRequest<LikedFoodCD> = LikedFoodCD.fetchRequest()
        
        do {
            let objects = try context.fetch(fetchRequest)
           
            completion(objects)
        } catch let error {
            print(error)
        }
    }
    
    func deleteRecipe(id: UUID) {
        let fetheRequest: NSFetchRequest<LikedFoodCD> = LikedFoodCD.fetchRequest()
        fetheRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        let context = persistentContainer.viewContext
        
        do {
            let recipes = try context.fetch(fetheRequest)
            for recipe in recipes {
                context.delete(recipe)
                print("DELETE")
            }
            saveContext()
            print("DELETE")
        } catch let error {
            print(error)
        }
    }
}
