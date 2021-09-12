//
//  GovSpendApp.swift
//  GovSpend
//
//  Created by Isaac M on 7/5/21.
//

import SwiftUI

@main
struct GovSpendApp: App {
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TabManagerView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
    }
}

