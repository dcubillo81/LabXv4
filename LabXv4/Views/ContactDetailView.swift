//
//  ContactDetailView.swift
//  LabXv4
//
//  Created by Daniel Cubillo on 30/3/21.
//

import SwiftUI

struct ContactDetailView: View {
    let cdetail: ContactEntity
    let vmodel: CoreDataViewModel
    
    var body: some View {
        NavigationView{
            VStack {
                List{
                //Text(cdetail.wrappedname)
                ForEach(cdetail.toMoneyarray, id: \.self) { annotation in
                    Text(annotation.wrappedammountdescription)
                    Text("\(annotation.colones)")
                    Text("\(annotation.dolares)")
                }
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle(cdetail.wrappedname)
            .navigationBarItems(
                trailing: NavigationLink(
                    destination: NewDebtView(cdetail: cdetail, vmodel: vmodel)) {
                        Image(systemName: "plus")
                            .imageScale(.large)
                        Text("Nueva deuda")
                    }
            )
        }
    }//view
}

//struct ContactDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        let test = ContactEntity()
//        ContactDetailView(cdetail: test)
//    }
//}
