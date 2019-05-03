//
//  Sounds+CoreDataProperties.swift
//  MyWonders
//
//  Created by Alexey Danilov on 4/27/19.
//  Copyright © 2019 DanilovDev. All rights reserved.
//
//

import Foundation
import CoreData


extension Sounds {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sounds> {
        return NSFetchRequest<Sounds>(entityName: "Sounds")
    }

    @NSManaged public var wonderName: String?
    @NSManaged public var wonderSoundTitle: String?
    @NSManaged public var wonderSoundURL: String?

}
