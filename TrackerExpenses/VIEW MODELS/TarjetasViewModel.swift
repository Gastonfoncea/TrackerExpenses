//
//  TarjetasViewModel.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 13/02/2024.
//

import Foundation

class TarjetasViewModel: ObservableObject {
    
    func getFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy" // Puedes ajustar el formato según tus preferencias
        
        let currentDate = Date()
        return dateFormatter.string(from: currentDate)
    }
    
    func calcularSuma(registros: [Registros]) -> Int {
        return registros.reduce(0) { $0 + (Int($1.monto) ?? 0) }
        
    }
    
    func DateString(fecha:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateString = dateFormatter.string(from: fecha)
        return dateString
        
    }
    
    func StringToInt(valor:String) -> Int {
        let valorInt = Int(valor)!
        return valorInt
        
    }
 
    
}


