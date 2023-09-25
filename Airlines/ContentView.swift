//
//  ContentView.swift
//  Airlines
//
//  Created by Safrana on 9/21/23.
//

import SwiftUI
import Firebase

struct ContentView: View {
    let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
        var body: some View {
            if isLoggedIn{
                AirlineListView()
            }else{
                LoginView()
            }
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
