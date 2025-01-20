//
//  Practice_Algorithms_App.swift
//  Practice(Algorithms)
//
//  Created by Roman Samborskyi on 19.01.2025.
//

import SwiftUI

@main
struct Practice_Algorithms_App: App {
    
    let netWorking: Networking = Networking()
    let coreData: CoreDataManager = CoreDataManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView(netWorking: netWorking, coreData: coreData)
        }
    }
}
