//
//  AhorrosView.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 12/02/2024.
//

import SwiftUI
import SwiftData

struct AhorrosView: View {
    
    @StateObject var tarjetasViewModel = TarjetasViewModel()
    @ObservedObject var vmRegistros: RegistrosViewModel
    @State var suma = 0
    
    var body: some View {
        VStack{
            List{
                VStack{
                    Text("$\(suma)")
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
                    ListItems(name: registro.detalle, motivo: registro.tipo, fecha: registro.fecha, monto: tarjetasViewModel.StringToInt(valor: registro.monto), color: Color.green)
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        vmRegistros.deleteRegistro(tipo: .ahorros, index: index)
                        suma = vmRegistros.sumarRegistrosPorTipo(tipo: .ahorros)
                        vmRegistros.sumatoriaIngresos()
                    }
                }  
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
        }
        .onAppear{
            suma = vmRegistros.sumarRegistrosPorTipo(tipo: .ahorros)
        }
    }
}

#Preview {
    AhorrosView(vmRegistros: RegistrosViewModel())
}
