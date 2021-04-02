//
//  NewDebtView.swift
//  LabXv4
//
//  Created by Daniel Cubillo on 30/3/21.
//

import SwiftUI

struct NewDebtView: View {
    
    let cdetail: ContactEntity
    let vmodel: CoreDataViewModel
    @State var newdescription: String = ""
    @State var newcolon: String = ""
    @State var newdolar: String = ""
    
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var coreDataVM = CoreDataViewModel()
    
    
    
    var body: some View {
        VStack{
            HStack{
                Text("Descripcion:")
                    .font(.title)
                    .foregroundColor(.blue)
                TextField("", text: $newdescription)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .font(.title)
            }//Hstack
            .padding()
            
            HStack{
                Text("Colones:")
                    .font(.title)
                    .foregroundColor(.blue)
                TextField("", text: $newcolon)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .font(.title)
                    .keyboardType(.decimalPad)
            }//Hstack
            .padding()
            
            HStack{
                Text("Dolares:")
                    .font(.title)
                    .foregroundColor(.blue)
                TextField("", text: $newdolar)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .font(.title)
                    .keyboardType(.decimalPad)
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
        self.vmodel.saveMoney(ammountdescription: newdescription, colones: Float(newcolon) ?? 0, dolares: Float(newdolar) ?? 0, toContact: cdetail)
        self.presentationMode.wrappedValue.dismiss()
    }
}

//struct NewDebtView_Previews: PreviewProvider {
//    static var previews: some View {
//        let test = ContactEntity()
//        NewDebtView(cdetail: test)
//    }
//}
