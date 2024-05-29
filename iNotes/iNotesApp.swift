//
//  iNotesApp.swift
//  iNotes
//
//  Created by Ganpat Jangir on 29/05/24.
//

import SwiftUI

@main
struct iNotesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
