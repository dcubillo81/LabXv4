//
//  MoneyEntity+CoreDataProperties.swift
//  LabXv4
//
//  Created by Daniel Cubillo on 30/3/21.
//
//

import Foundation
import CoreData


extension MoneyEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MoneyEntity> {
        return NSFetchRequest<MoneyEntity>(entityName: "MoneyEntity")
    }

    @NSManaged public var ammountdescription: String?
    @NSManaged public var colones: Float
    @NSManaged public var dolares: Float
    @NSManaged public var toContact: ContactEntity?
    
    public var wrappedammountdescription: String{
        ammountdescription ?? "No description"
    }

}

extension MoneyEntity : Identifiable {

}
