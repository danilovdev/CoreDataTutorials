//
//  CoreDataManager.swift
//  Companies
//
//  Created by Alexey Danilov on 5/4/19.
//  Copyright © 2019 DanilovDev. All rights reserved.
//

import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CompaniesModels")
        container.loadPersistentStores(completionHandler: { storeDescription, error in
            if let error = error {
                fatalError("Loading of store failed: \(error)")
            }
        })
        return container
    }()
}
