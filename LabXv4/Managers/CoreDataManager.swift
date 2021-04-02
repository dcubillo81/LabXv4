//
//  CoreDataManager.swift
//  LabXv4
//
//  Created by Daniel Cubillo on 29/3/21.
//

import Foundation
import CoreData

class CoreDataManager{
    
    let persistentContainer: NSPersistentContainer
    
    init(){
        // Which files should the container use.
        persistentContainer = NSPersistentContainer(name: "DataModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                print("Unable to load Core Data Store \(error)")
                
            }
            
        }
    }
    
    func saveContact(name: String){
        let newname = ContactEntity(context: persistentContainer.viewContext)
        newname.name = name

        if let result = try? persistentContainer.viewContext.save(){
            print("Success to save task")
        }else{
            print("Failed to save task")
        }
        
    }
    
    func saveMoney(ammountdescription: String, colones:Float, dolares: Float, toContact: ContactEntity){
        let newammount = MoneyEntity(context: persistentContainer.viewContext)
        newammount.ammountdescription = ammountdescription
        newammount.colones = colones
        newammount.dolares = dolares
        newammount.toContact = toContact

        if let result = try? persistentContainer.viewContext.save(){
            print("Success to save task")
        }else{
            print("Failed to save task")
        }
        
    }
    
    func getAllContacts() -> [ContactEntity] {
        let fetchRequest: NSFetchRequest<ContactEntity> = ContactEntity.fetchRequest()
        
        if let result = try? persistentContainer.viewContext.fetch(fetchRequest){
            print("Success to retrieve all tasks")
            return result
        }
        print("Failed to retrieve all tasks")
        return []

    }
    
    func deleteContact(name: ContactEntity){
        // Mark for deletion
        persistentContainer.viewContext.delete(name)
        
        if let result = try? persistentContainer.viewContext.save(){
            print("Success to delete task")
        }else{
            persistentContainer.viewContext.rollback()
            print("Failed to delete task")
        }
        
    }
    
    func deleteMoney(name: MoneyEntity){
        // Mark for deletion
        persistentContainer.viewContext.delete(name)
        
        if let result = try? persistentContainer.viewContext.save(){
            print("Success to delete task")
        }else{
            persistentContainer.viewContext.rollback()
            print("Failed to delete task")
        }
        
    }
    
    
}
