//
//  Photos+CoreDataProperties.swift
//  MyWonders
//
//  Created by Alexey Danilov on 4/27/19.
//  Copyright © 2019 DanilovDev. All rights reserved.
//
//

import Foundation
import CoreData


extension Photos {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photos> {
        return NSFetchRequest<Photos>(entityName: "Photos")
    }

    @NSManaged public var wonderName: String
    
    @NSManaged public var wonderPhoto: NSData

}
