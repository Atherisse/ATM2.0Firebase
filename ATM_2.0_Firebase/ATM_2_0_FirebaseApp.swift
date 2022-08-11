//
//  ATM_2_0_FirebaseApp.swift
//  ATM_2.0_Firebase
//
//  Created by user217621 on 7/22/22.
//

import SwiftUI
import Firebase

@main
struct ATM_2_0_FirebaseApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LogInView()
        }
    }
}
