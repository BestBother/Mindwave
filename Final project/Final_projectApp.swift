//
//  Final_projectApp.swift
//  Final project
//
//  Created by Keshawn B on 10/29/24.
//

import SwiftUI
import Firebase


@main
struct Final_projectApp: App {
    
    init(){
        
        FirebaseConfiguration.shared.setLoggerLevel(.debug)
        FirebaseApp.configure()
        
    }
    
    var body: some Scene {
        WindowGroup {
            CBT_Journal()
        }
    }
}
