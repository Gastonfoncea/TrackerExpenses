//
//  GastosView.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 12/02/2024.
//

import SwiftUI
import SwiftData

struct GastosView: View {
    
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
                    Text("Tus Gastos acumulados")
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
                
                ForEach(vmRegistros.fetchRegistros(tipo: .gastos)) {registro in
                        ListItems(name: registro.detalle, motivo: registro.tipo, fecha: registro.fecha, monto:tarjetasViewModel.StringToInt(valor: registro.monto), color: Color.red)
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        vmRegistros.deleteRegistro(tipo: .gastos, index: index)
                        suma = vmRegistros.sumarRegistrosPorTipo(tipo: .gastos)
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
        }
        .onAppear{
            suma = vmRegistros.sumarRegistrosPorTipo(tipo: .gastos)
        }
    }
    
}

#Preview {
    GastosView(vmRegistros: RegistrosViewModel())
}
