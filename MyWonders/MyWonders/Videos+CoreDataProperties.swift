//
//  Videos+CoreDataProperties.swift
//  MyWonders
//
//  Created by Alexey Danilov on 4/27/19.
//  Copyright © 2019 DanilovDev. All rights reserved.
//
//

import Foundation
import CoreData


extension Videos {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Videos> {
        return NSFetchRequest<Videos>(entityName: "Videos")
    }

    @NSManaged public var wonderName: String?
    @NSManaged public var wonderVideoURL: String?

}
