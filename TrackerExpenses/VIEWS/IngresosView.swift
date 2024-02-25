//
//  IngresosView.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 12/02/2024.
//

import SwiftUI
import SwiftData

struct IngresosView: View {
    
    @Query(filter: #Predicate<Registros>{$0.tipo == "Ingresos" },sort:\Registros.fecha) var registros: [Registros]
    @Environment(\.modelContext) var context
    @StateObject var tarjetasViewModel = TarjetasViewModel()
    
    var body: some View {
        VStack{
            List{
                VStack{
                    Text("$\(tarjetasViewModel.calcularSuma(registros:registros))")
                        .font(.largeTitle)
                        .bold()
                    Text("Tus Ingresos acumulados")
                        .padding(.top,3)
                        .font(.system(size: Apptheme.fontSizeSubTitles2))
                        .bold()
                    Text(tarjetasViewModel.getFormattedDate())
                        .padding(.top,3)
                        .font(.system(size: Apptheme.fontSizeSubTitles2))
                        .bold()
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .listRowSeparator(.hidden, edges: .top)
                .padding(.vertical, 16)
                
                ///Recorremos la lista de los registros guardados en swiftData
                ForEach(registros) {registro in
                    ListItems(name: registro.detalle, motivo: registro.tipo, fecha: registro.fecha, monto:tarjetasViewModel.StringToInt(valor: registro.monto), color: Color.greenColor1)
                }
                .onDelete{ indexSet in
                    for index in indexSet {
                        context.delete(registros[index])
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
        }
    }
 
}

#Preview {
    IngresosView()
}

