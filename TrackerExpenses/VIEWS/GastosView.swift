//
//  GastosView.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 12/02/2024.
//

import SwiftUI
import SwiftData

struct GastosView: View {
    
    @Environment(\.modelContext) var context
    @Query(filter: #Predicate<Registros>{$0.tipo == "Gastos"}, sort: \Registros.fecha) var registros: [Registros]
    @StateObject var tarjetasViewModel = TarjetasViewModel()
    
    var body: some View {
        VStack{
            List{
                VStack{
                    Text("$\(tarjetasViewModel.calcularSuma(registros:registros))")
                        .font(.largeTitle)
                        .bold()
                    Text("Tus Gastos acumulados")
                        .padding(.top,3)
                        .font(.system(size: 17))
                        .bold()
                    Text(tarjetasViewModel.getFormattedDate())
                        .padding(.top,3)
                        .font(.system(size: 17))
                        .bold()
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .listRowSeparator(.hidden, edges: .top)
                .padding(.vertical, 16)
                ForEach(registros) {registro in
                        ListItems(name: registro.detalle, motivo: registro.tipo, fecha: registro.fecha, monto:tarjetasViewModel.StringToInt(valor: registro.monto), color: Color.red)
                }
                .onDelete { indexSet in
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
    GastosView()
}
