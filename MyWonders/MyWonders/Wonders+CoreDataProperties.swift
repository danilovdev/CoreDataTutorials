//
//  Wonders+CoreDataProperties.swift
//  MyWonders
//
//  Created by Alexey Danilov on 4/27/19.
//  Copyright © 2019 DanilovDev. All rights reserved.
//
//

import Foundation
import CoreData

extension Wonders {

    @NSManaged public var wonderName: String
    
    @NSManaged public var wonderType: String
    
    @NSManaged public var wonderNotes: String
    
    @NSManaged public var wonderShow: Bool
    
    @NSManaged public var wonderLatitude: Double
    
    @NSManaged public var wonderLongitude: Double

}
