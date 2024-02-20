//
//  TrackerExpensesApp.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 07/02/2024.
//

import SwiftUI
import SwiftData

@main
struct TrackerExpensesApp: App {
    var body: some Scene {
        WindowGroup {
            Home()
        }
        .modelContainer(for: Registros.self)
    }
}
