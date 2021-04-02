//
//  MainListV2View.swift
//  LabXv4
//
//  Created by Daniel Cubillo on 30/3/21.
//

import SwiftUI
import CoreData
struct MainListV2View: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: ContactEntity.entity(), sortDescriptors: []) var contactlist: FetchedResults<ContactEntity>
    
    var body: some View {
        VStack {
            List {
                ForEach(contactlist, id: \.self) { contact in
                    Section(header: Text(contact.wrappedname)) {
                        ForEach(contact.toMoneyarray, id: \.self) { annotation in
                            Text(annotation.wrappedammountdescription)
                            Text("\(annotation.colones)")
                            Text("\(annotation.dolares)")
                        }
                    }
                }
            }

            Button("Add") {
                let deuda1 = MoneyEntity(context: self.moc)
                deuda1.ammountdescription = "McDonalds"
                deuda1.colones = 5980
                deuda1.dolares = 34.89
                deuda1.toContact = ContactEntity(context:self.moc)
                deuda1.toContact?.name = "Fanny"
                
                let deuda2 = MoneyEntity(context: self.moc)
                deuda2.ammountdescription = "BK"
                deuda2.colones = 12500
                deuda2.dolares = 0
                deuda2.toContact = ContactEntity(context:self.moc)
                deuda2.toContact?.name = "Fanny"
                
                let deuda3 = MoneyEntity(context: self.moc)
                deuda3.ammountdescription = "Uber"
                deuda3.colones = 1200
                deuda3.dolares = 2.99
                deuda3.toContact = ContactEntity(context:self.moc)
                deuda3.toContact?.name = "Sonia"
            
                try? self.moc.save()
            }
        }//Vstack
    }
}

struct MainListV2View_Previews: PreviewProvider {
    static var previews: some View {
        MainListV2View()
    }
}
