//
//  ContentView.swift
//  LabX
//
//  Created by Daniel Cubillo on 27/3/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("status") var logged = false
    
    var body: some View {
        NavigationView{
            if logged{
                MainListView()
                    .navigationBarHidden(true)
            }else{
                LogInView()
                    .navigationBarHidden(true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
