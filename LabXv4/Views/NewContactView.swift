//
//  NewContactView.swift
//  LabXv4
//
//  Created by Daniel Cubillo on 29/3/21.
//

import SwiftUI

struct NewContactView: View {
    @State var NewName: String = ""
    
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var coreDataVM = CoreDataViewModel()
    
    
    
    var body: some View {
        VStack{
            HStack{
                Text("Nombre nuevo:")
                    .font(.title)
                    .foregroundColor(.blue)
                TextField("", text: $NewName)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .font(.title)
            }//Hstack
            .padding()
            
            Button(action: Save) {
                Text("Agregar")
                    .font(.headline)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width)
                    .foregroundColor(.white)
                    .background(Color.green)
            }//button
        }//VStack
    }//View
    
    func Save(){
        self.coreDataVM.saveContact(name: NewName)
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct NewContactView_Previews: PreviewProvider {
    static var previews: some View {
        NewContactView()
    }
}
