//
//  CoreDataViewModel.swift
//  LabXv4
//
//  Created by Daniel Cubillo on 29/3/21.
//

import Foundation
import CoreData

class CoreDataViewModel: ObservableObject{
    @Published var coreDM = CoreDataManager()
    @Published var names: [ContactEntity] = [ContactEntity]()
    
    
    func saveContact(name: String){
        //Validations
        coreDM.saveContact(name: name)
    }
    
    func getAllNames(){
        names = self.coreDM.getAllContacts()
    }
    
    func deleteContact(name:ContactEntity){
        //Validations
        coreDM.deleteContact(name: name)
    }
    
    func saveMoney(ammountdescription: String, colones:Float, dolares: Float, toContact: ContactEntity){
        coreDM.saveMoney(ammountdescription: ammountdescription, colones: colones, dolares: dolares, toContact: toContact)
    }
    
    func deleteMoney(name:MoneyEntity){
        //Validations
        coreDM.deleteMoney(name: name)
    }
    
}
