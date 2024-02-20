//
//  Registros.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 07/02/2024.
//

import Foundation
import SwiftData


//Aca crearemos los registros de cada salida de plata, sera el MODEL
@Model
class Registros {
    
    var tipo: String
    var monto: String
    var detalle: String
    var fecha: Date
    
    init(tipo: String, monto: String, detalle: String, fecha: Date) {
        self.tipo = tipo
        self.monto = monto
        self.detalle = detalle
        self.fecha = fecha
    }
}
