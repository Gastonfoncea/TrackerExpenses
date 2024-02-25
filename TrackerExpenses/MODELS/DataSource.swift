//
//  DataSource.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 25/02/2024.
//

import Foundation
import SwiftData

final class RegistroDataSource {
    
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = RegistroDataSource()
    
    @MainActor
        init() {
        self.modelContainer = try! ModelContainer(for: Registros.self)
        self.modelContext = modelContainer.mainContext
        
    }
    
    
    
    
    
}
