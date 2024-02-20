//
//  SumatoriaPrueba.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 13/02/2024.
//

import SwiftUI
import SwiftData

struct SumatoriaPrueba: View {
    @Query(filter: #Predicate<Registros>{$0.tipo == "Ingresos" },sort:\Registros.fecha) var registros: [Registros]
    @Environment(\.modelContext) var context
    var sumatoria = 0
    
    var body: some View {
        List{
            //var suma = registros.reduce(0) {$0 + (Int($1.monto) ?? 0) }
            VStack{
                Text("\(calcularSuma(registros:registros))")
            }
            ForEach(registros) {registro in
                Text(registro.monto)}
            
        }
        
        
    }
    
    func calcularSuma(registros: [Registros]) -> Int {
        return registros.reduce(0) { $0 + (Int($1.monto) ?? 0) }
        
    }
}

#Preview {
    SumatoriaPrueba()
}
