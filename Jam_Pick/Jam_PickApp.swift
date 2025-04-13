//
//  Jam_PickApp.swift
//  Jam_Pick
//
//  Created by 지구 on 4/13/25.
//

import SwiftUI

@main
struct Jam_PickApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
