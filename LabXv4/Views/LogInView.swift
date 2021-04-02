//
//  LogInView.swift
//  LabX
//
//  Created by Daniel Cubillo on 27/3/21.
//

import SwiftUI

struct LogInView: View {
    @State var userName = ""
    @State var password = ""
    @AppStorage("stored_User") var user = "dcubillo"
    @AppStorage("stored_Pass") var pass = "12345"
    @AppStorage("status") var logged = false
    
    var body: some View {
        VStack{
            Image("senna")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .padding(.horizontal, 90)
                .padding(.vertical)
            HStack{
                VStack(alignment: .leading, spacing: 12, content: {
                    Text("Login")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                    Text("Ingrese sus datos para continuar")
                })
                Spacer(minLength: 0)
                
            }//HStack
            .padding()
            
            HStack{
                Image(systemName: "person")
                    .font(.title2)
                    .foregroundColor(.black)
                    .frame(width: 35)
                TextField("User", text: $userName)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }//HStack
            .padding()


            HStack{
                Image(systemName: "lock")
                    .font(.title2)
                    .foregroundColor(.black)
                    .frame(width: 35)
                SecureField("Password", text: $password)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }//HStack
            .padding()


            Button(action: authenticateUserPassword, label:{
                Text("LOGIN")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width)
                    .foregroundColor(.white)
                    .background(Color.green)
                })
                .disabled(userName != "" && password != "" ? false: true )
        }
        
        
    }
    
    func authenticateUserPassword(){
        if userName == user && password == pass {
            withAnimation(.easeOut){logged = true}
        }else{
            print("User Password Does not match")
        }
    }
    
}


struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}

