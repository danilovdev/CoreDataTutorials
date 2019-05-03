//
//  Settings+CoreDataProperties.swift
//  MyWonders
//
//  Created by Alexey Danilov on 4/27/19.
//  Copyright © 2019 DanilovDev. All rights reserved.
//
//

import Foundation
import CoreData


extension Settings {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Settings> {
        return NSFetchRequest<Settings>(entityName: "Settings")
    }

    @NSManaged public var showOldWorldWonders: Bool
    @NSManaged public var showNewWorldWonders: Bool

}
