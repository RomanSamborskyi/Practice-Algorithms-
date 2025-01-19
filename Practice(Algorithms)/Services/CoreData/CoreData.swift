//
//  CoreData.swift
//  Practice(Algorithms)
//
//  Created by Roman Samborskyi on 19.01.2025.
//

import UIKit
import CoreData


class CoreDataManager {
    
    private let containerName: String = "News"
    private let newsEntityName: String = "NewsEntity"
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: containerName)
        context = container.viewContext
        container.loadPersistentStores { description, error in
            if error == nil {
                print("Success of load core data ✅")
            } else {
                print("Error of load core data ❌")
            }
        }
    }
    
    func save() {
        do {
            try context.save()
        } catch let error {
            print("Error of saving: \(error.localizedDescription)")
        }
    }
    
}

