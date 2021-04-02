//
//  MainListView.swift
//  LabXv4
//
//  Created by Daniel Cubillo on 29/3/21.
//

import SwiftUI

struct MainListView: View {
    @ObservedObject var coreDataVM = CoreDataViewModel()
    @AppStorage("status") var logged = true
    @State var debtcolon: Float = 0
    @State var debtdolar: Float = 0
    
    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(coreDataVM.names, id: \.self) {
                        name in
                        NavigationLink(destination: ContactDetailView(cdetail: name, vmodel: coreDataVM)) {
                            Text(name.wrappedname)
                                .foregroundColor(.blue)
                        }//NavigationLink
                    }
                    .onDelete(perform: { indexSet in
                        indexSet.forEach { index in
                            let deletename = coreDataVM.names[index]
                            coreDataVM.deleteContact(name: deletename)
                            coreDataVM.getAllNames()
                        }
                    })
                }//list
                
                Button(action:{
                    logged = false
                }, label: {
                    Text("Logout")
                })
                
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Mi Saldo")
            .navigationBarItems(
                trailing: NavigationLink(
                    destination: NewContactView()) {
                        Image(systemName: "plus")
                            .imageScale(.large)
                        Text("Nuevo nombre")
                    }
            )
            .onAppear(perform: {
                self.coreDataVM.getAllNames()
            })
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
    }
}
