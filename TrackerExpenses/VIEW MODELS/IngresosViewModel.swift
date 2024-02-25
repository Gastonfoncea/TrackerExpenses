//
//  IngresosViewModel.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 13/02/2024.
//

import Foundation
import SwiftData

class IngresosViewModel: ObservableObject {
    
    @Published var sumatoria: String = ""
    
     var ingresosPicker: [String] = ["Sueldo 💵","Negocios 💻","Otros❔"]
    
}
