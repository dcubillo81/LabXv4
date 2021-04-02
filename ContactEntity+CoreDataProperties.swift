//
//  ContactEntity+CoreDataProperties.swift
//  LabXv4
//
//  Created by Daniel Cubillo on 30/3/21.
//
//

import Foundation
import CoreData


extension ContactEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactEntity> {
        return NSFetchRequest<ContactEntity>(entityName: "ContactEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var toMoney: NSSet?
    
    public var wrappedname: String{
        name ?? ""
    }
    
    public var toMoneyarray: [MoneyEntity]{
        let set = toMoney as? Set<MoneyEntity> ?? []
        
        return set.sorted{
            $0.wrappedammountdescription < $1.wrappedammountdescription
        }
    }

}

// MARK: Generated accessors for toMoney
extension ContactEntity {

    @objc(addToMoneyObject:)
    @NSManaged public func addToToMoney(_ value: MoneyEntity)

    @objc(removeToMoneyObject:)
    @NSManaged public func removeFromToMoney(_ value: MoneyEntity)

    @objc(addToMoney:)
    @NSManaged public func addToToMoney(_ values: NSSet)

    @objc(removeToMoney:)
    @NSManaged public func removeFromToMoney(_ values: NSSet)

}

extension ContactEntity : Identifiable {

}
