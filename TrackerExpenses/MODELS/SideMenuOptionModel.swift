//
//  SideMenuOptionModel.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 05/03/2024.
//

import Foundation


enum SideMenuOptionModel: Int, CaseIterable {
    case historial
    case perfil
    
    var title: String {
        switch self {
        case .historial:
            return "Historial"
        case .perfil:
            return "Perfil"
        }
    }
    
    var image: String {
        switch self {
        case .historial:
            return "stopwatch.fill"
        case .perfil:
            return "person.fill"
        }
    }
    
}

extension SideMenuOptionModel: Identifiable {
    var id: Int { return self.rawValue }
}
