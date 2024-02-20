//
//  AhorrosView.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 12/02/2024.
//

import SwiftUI
import SwiftData

struct AhorrosView: View {
    
    @Environment (\.modelContext) var context
    @Query(filter: #Predicate<Registros> {$0.tipo == "Ahorros"}, sort: \Registros.fecha) var registros: [Registros]
    @StateObject var tarjetasViewModel = TarjetasViewModel()
    
    var body: some View {
        VStack{
            List{
                VStack{
                    Text("$\(tarjetasViewModel.calcularSuma(registros:registros))")
                        .font(.largeTitle)
                        .bold()
                    Text("Tus Ahorros acumulados")
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
                    Text(String(registro.monto))
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        context.delete(registros[index])
                    }
                }  
            }
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    AhorrosView()
}
