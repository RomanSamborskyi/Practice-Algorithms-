//
//  CoreData.swift
//  Practice(Algorithms)
//
//  Created by Roman Samborskyi on 19.01.2025.
//

import UIKit
import CoreData


class CoreDataManager {
    
    private(set) var containerName: String = "News"
    private(set) var newsEntityName: String = "NewsEntity"
    private(set) var NewsSourceEntity: String = "NewsSourceEntity"
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
    
    func addToCoreData(_ news: NewsModel) {
        let newItem = NewsEntity(context: context)
        newItem.descript = news.description
        newItem.author = news.author
        newItem.content = news.content
        newItem.publishedAt = news.publishedAt
        newItem.title = news.title
        newItem.url = news.url
        newItem.urlToImage = news.urlToImage
        newItem.newsSource?.id = news.source.id
        newItem.newsSource?.name = news.source.name
        
        save()
    }
    
    
    
    func save() {
        do {
            try context.save()
        } catch let error {
            print("Error of saving: \(error.localizedDescription)")
        }
    }
    
}

