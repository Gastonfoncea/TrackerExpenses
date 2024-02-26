//
//  RegistrosViewModel.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 23/02/2024.
//

import Foundation
import SwiftData
import SwiftUI


class RegistrosViewModel: ObservableObject {
    
    @Published var registros: [Registros] = []
    
    //traeremos los registros completos
    //buscaremos la forma de filtrarlos
    //trabajaremos con los registros
    
    
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = RegistrosViewModel()
    
    
    @MainActor
    init() {
        self.modelContainer = try! ModelContainer(for: Registros.self)
        self.modelContext = modelContainer.mainContext
        
    }
    
    
    
    // MARK: FUNCIONES PRINCIPALES - CRUD - CREATE! - READ! - UPDATE - DELETE
    
    enum tipo {
        case ingresos
        case gastos
        case ahorros
    }
    
    func saveRegistro(tipo: String,monto: String,detalle: String,fecha: Date, categoria: String) {
        //creamos y guardamos el registro en swiftdata
        let registroSwiftData = Registros(tipo: tipo, monto: monto, detalle: detalle, fecha: fecha, categoria: categoria)
        modelContext.insert(registroSwiftData)
        //insertamos la variable creada en la clase de swiftdata que creamos
        
    }
    
    func fetchRegistros(tipo: tipo) -> [Registros] {
        switch tipo{
        case .ingresos:
            ///Busqueda FetchDescriptor y predicate en la base de datos de SwiftData - Ingresos
            let ingresosPredicate = #Predicate<Registros> {  $0.tipo == "Ingresos" }
            let ingresosDescriptor = FetchDescriptor<Registros>(predicate: ingresosPredicate)
            let ingresos = try! modelContext.fetch(ingresosDescriptor)
            return ingresos
            
        case .gastos:
            ///Busqueda FetchDescriptor y predicate en la base de datos de SwiftData - Gastos
            let gastosPredicate = #Predicate<Registros> { $0.tipo == "Gastos" }
            let gastosDescriptor = FetchDescriptor<Registros> (predicate: gastosPredicate)
            let gastos = try! modelContext.fetch(gastosDescriptor)
            return gastos
            
        case .ahorros:
            ///Busqueda FetchDescriptor y predicate en la base de datos de SwiftData - Ahorros
            let ahorrosPredicate = #Predicate<Registros> { $0.tipo == "Ahorros" }
            let ahorrosDescriptor = FetchDescriptor<Registros> (predicate: ahorrosPredicate)
            let ahorros = try! modelContext.fetch(ahorrosDescriptor)
            return ahorros
        }
    }
    
    func deleteRegistro(tipo:tipo, index: Int) {
        
        switch tipo {
        case .ingresos:
            let ingresosPredicate = #Predicate<Registros> {  $0.tipo == "Ingresos" }
            let ingresosDescriptor = FetchDescriptor<Registros>(predicate: ingresosPredicate)
            let ingresos = try! modelContext.fetch(ingresosDescriptor)
            modelContext.delete(ingresos[index])
            
        case .gastos:
            let gastosPredicate = #Predicate<Registros> { $0.tipo == "Gastos" }
            let gastosDescriptor = FetchDescriptor<Registros> (predicate: gastosPredicate)
            let gastos = try! modelContext.fetch(gastosDescriptor)
            modelContext.delete(gastos[index])
            
        case .ahorros:
            let ahorrosPredicate = #Predicate<Registros> { $0.tipo == "Ahorros" }
            let ahorrosDescriptor = FetchDescriptor<Registros> (predicate: ahorrosPredicate)
            let ahorros = try! modelContext.fetch(ahorrosDescriptor)
            modelContext.delete(ahorros[index])
        }
    }
    
    
    
    //MARK: FUNCIONES SECUNDARIAS: Balance ; FetchPorTipo ; sumarRegistrosPorTipo
    
    /// BALANCE
    func sumatoriaIngresos() -> Int {
        
        var total = 0
        
        ///Busqueda FetchDescriptor y predicate en la base de datos de SwiftData - Ingresos
        let ingresosPredicate = #Predicate<Registros> {  $0.tipo == "Ingresos" }
        let ingresosDescriptor = FetchDescriptor<Registros>(predicate: ingresosPredicate)
        let ingresos = try! modelContext.fetch(ingresosDescriptor)
        
        ///Busqueda FetchDescriptor y predicate en la base de datos de SwiftData - Gastos
        let gastosPredicate = #Predicate<Registros> { $0.tipo == "Gastos" }
        let gastosDescriptor = FetchDescriptor<Registros> (predicate: gastosPredicate)
        let gastos = try! modelContext.fetch(gastosDescriptor)
        
        /// sumatoria de los gastos y los ingresos para poderlos restar
        let ingresosCalculo = ingresos.reduce(0) { $0 + (Int($1.monto) ?? 0 )}
        let gastosCalculo = gastos.reduce(0) { $0 + (Int($1.monto) ?? 0 )}
        
        total = ingresosCalculo - gastosCalculo
        print(total)
        return total
    }
    
    
    func sumarRegistrosPorTipo(tipo:tipo) -> Int {
        switch tipo {
        case .ingresos:
            let ingresosPredicate = #Predicate<Registros> {  $0.tipo == "Ingresos" }
            let ingresosDescriptor = FetchDescriptor<Registros>(predicate: ingresosPredicate)
            let ingresos = try! modelContext.fetch(ingresosDescriptor)
            let ingresosCalculo = ingresos.reduce(0) { $0 + (Int($1.monto) ?? 0 )}
            return ingresosCalculo
            
        case .gastos:
            let gastosPredicate = #Predicate<Registros> { $0.tipo == "Gastos" }
            let gastosDescriptor = FetchDescriptor<Registros> (predicate: gastosPredicate)
            let gastos = try! modelContext.fetch(gastosDescriptor)
            let gastosCalculo = gastos.reduce(0) { $0 + (Int($1.monto) ?? 0 )}
            return gastosCalculo
            
        case .ahorros:
            let ahorrosPredicate = #Predicate<Registros> { $0.tipo == "Ahorros" }
            let ahorrosDescriptor = FetchDescriptor<Registros> (predicate: ahorrosPredicate)
            let ahorros = try! modelContext.fetch(ahorrosDescriptor)
            let ahorrosCalculo = ahorros.reduce(0) { $0 + (Int($1.monto) ?? 0 )}
            return ahorrosCalculo
        }
    }
    
    
}



