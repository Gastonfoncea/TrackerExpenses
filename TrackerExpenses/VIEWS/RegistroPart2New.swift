//
//  RegistroPart2New.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 14/02/2024.
//

import SwiftUI
import SwiftData


struct RegistroPart2New: View {
    @ObservedObject var viewModelCalculadora: ViewModelCalculadora
    var motivo: String
    @State var textFieldText: String = ""
    @State var date: Date = .now
    var registro: [Registros] = []
    @Environment (\.dismiss) private var dismiss
    @Environment(\.modelContext) var context
    
    var body: some View {
        VStack{
            Color.accentColor1
                .ignoresSafeArea(.all)
                .overlay {/// aca creamos la vista del fondo azul----------------------
                    VStack{
                        Text("Valor del ingreso:")
                            .font(.system(size: 20))
                            .foregroundStyle(.white)
                            .bold()
                            .padding(.bottom)
                        Text("$ \(viewModelCalculadora.textfieldValue)")
                            .font(.system(size: 55))
                            .padding(.trailing,30)
                            .foregroundStyle(.white)
                    }
                }
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .ignoresSafeArea(.all)
                    .frame(height: 520)
                    .overlay { /// aca creamos la vista del fondo blanco----------------------
                        VStack{
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
                            
                            // MARK: PICKER PARA SELECCIONAR CATEGORIA
                            
                            Spacer()
                            VStack{
                                Button {
                                    ///creamos y guardamos el registro en swiftdata
                                    let registroSwiftData = Registros(tipo: motivo, monto: viewModelCalculadora.textfieldValue, detalle: textFieldText, fecha: date)
                                    ///insertamos la variable creada en la clase de swiftdata que creamos
                                    context.insert(registroSwiftData)
                                    viewModelCalculadora.autoGuardado.toggle()
                                    dismiss()
                                    
                                } label: {
                                    ButtonGeneralNavigation(color: .blue, text: "Listo")
                                        .opacity(textFieldText.count < 1 ? 0 : 1)
                                        .animation(Animation.easeInOut(duration: 1.0))
                                    
                                }
                            }
                        }
                        .padding(.top)
                        .padding(.horizontal)
                        
                    }
            }
        }
        .background(Color.accentColor1)
    }
}

#Preview {
    RegistroPart2New(viewModelCalculadora: ViewModelCalculadora(), motivo: "Ingresos")
}
