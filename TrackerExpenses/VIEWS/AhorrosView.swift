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
    @StateObject var vmRegistros = RegistrosViewModel()
    
    var body: some View {
        VStack{
            List{
                VStack{
                    Text("$\(vmRegistros.sumarRegistrosPorTipo(tipo: .ahorros))")
                        .font(.largeTitle)
                        .bold()
                    Text("Tus Ahorros acumulados")
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
                
                ForEach(vmRegistros.fetchRegistros(tipo: .ahorros)) {registro in
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
