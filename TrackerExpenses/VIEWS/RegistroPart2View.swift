//
//  RegistroPart2View.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 10/02/2024.
//

import SwiftUI
import SwiftData

struct RegistroPart2View: View {
    
    @ObservedObject var viewModelCalculadora: ViewModelCalculadora
    @StateObject var viewModelTarjetas = TarjetasViewModel()
    var motivo: String
    @State var textFieldText: String = ""
    @State var date: Date = .now
    var registro: [Registros] = []
    @Environment (\.dismiss) private var dismiss
    @Environment(\.modelContext) var context
    
    var body: some View {
      
            VStack{
                Text("Valor del ingreso:")
                    .font(.system(size: 20))
                    .bold()
               // let monto = viewModelTarjetas.StringToInt(valor: viewModelCalculadora.textfieldValue)
                Text("$\(viewModelCalculadora.textfieldValue)")
                    .font(.system(size: 55))
                    .padding(.trailing,30)
                HStack{
                    Text("Detalle del ingreso")
                        .font(.system(size: 17))
                    Spacer()
                }
                    .padding(.top)
                    .padding(.horizontal)
                TextfieldGeneral(nombreTextfield: "Escribi una descripcion del gasto", referencia: $textFieldText)
                DatePicker("Fecha", selection: $date, displayedComponents: .date)
                    .padding()
                
                Button {
                    ///creamos y guardamos el registro en swiftdata
                    let registroSwiftData = Registros(tipo: motivo, monto: viewModelCalculadora.textfieldValue, detalle: textFieldText, fecha: date)
                    ///insertamos la variable creada en la clase de swiftdata que creamos
                    context.insert(registroSwiftData)
                    viewModelCalculadora.autoGuardado.toggle()
                    dismiss()
                    
                } label: {
                    ButtonGeneralNavigation(color: .blue, text: "Listo")
                   
                }
            }
            .padding(.horizontal)
    }
}

#Preview {
    RegistroPart2View(viewModelCalculadora: ViewModelCalculadora(), motivo: "Gasto")
      
}
