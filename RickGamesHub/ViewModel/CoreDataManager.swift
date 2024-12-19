//
//  CoreDataManager.swift
//  RickGamesHub
//
//  Created by Ricky Primayuda Putra on 19/12/24.
//

import CoreData

class CoreDataManager {
    
    static let instance = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "FavoritesGame")
        container.loadPersistentStores{ ( description, error ) in
            if let error = error {
                print("Error loading core data. \(error)")
            } else {
                print("Successfully connected on core data")
            }
        }
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
            print("Successfully")
        } catch let error {
            print("Error saving to core data. \(error.localizedDescription)")
        }
    }
    
}
