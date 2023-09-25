//
//  AirlinesApp.swift
//  Airlines
//
//  Created by Safrana on 9/21/23.
//

import SwiftUI
import Firebase

@main
struct AirlinesApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
