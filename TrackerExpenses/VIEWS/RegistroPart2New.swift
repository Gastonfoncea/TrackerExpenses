//
//  RegistroPart2New.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 14/02/2024.
//

import SwiftUI
import SwiftData


struct RegistroPart2New: View {
    
    @ObservedObject var vmCalculadora: ViewModelCalculadora
    @ObservedObject var vmRegistros : RegistrosViewModel
    @StateObject var vmIngresos = IngresosViewModel()
    @StateObject var vmGastos = GastosViewModel()
    @StateObject var vmAhorros = AhorrosVIewModel()
    var motivo: String
    @State var textFieldText: String = ""
    @State var date: Date = .now
    @State private var larger = true
    @Environment (\.dismiss) private var dismiss
    @State var selected = "Sueldo"


    var body: some View {
        VStack{
            Color.accentColor1
                .ignoresSafeArea(.all)
                .overlay {/// aca creamos la vista del fondo azul----------------------
                    VStack{
                        Text("Valor del \(String(motivo.dropLast())):")
                            .font(.system(size: Apptheme.fontSizeSubTitles1))
                            .foregroundStyle(.white)
                            .bold()
                            .padding(.bottom)
                        Text("$ \(vmCalculadora.textfieldValue)")
                            .font(.system(size: 55))
                            .padding(.trailing,30)
                            .foregroundStyle(.white)
                    }
                }
            ZStack{
                    WhiteCard()
                    .overlay { /// aca creamos la vista del fondo blanco----------------------
                        
                        VStack(spacing: 20) {
                            HStack{
                                Text("Detalle del \(String(motivo.dropLast()))")
                                    .font(.system(size: Apptheme.fontSizeSubTitles2))
                                Spacer()
                            }
                            .padding(.top)
                            .padding(.horizontal)
                            
                            TextfieldGeneral(nombreTextfield: "Escribi una descripcion del gasto", referencia: $textFieldText)
                            
                            DatePicker("Fecha", selection: $date, displayedComponents: .date)
                                .font(.system(size: Apptheme.fontSizeSubTitles2))
                                .padding(.horizontal)
                            
                            Picker("Categoria", selection: $selected) {
                                switch motivo {
                                case "Ingresos":
                                    ForEach(vmIngresos.ingresosPicker, id: \.self) {option in
                                        Text(option)
                                    }
                                case "Gastos":
                                    ForEach(vmGastos.gastosPicker, id: \.self) {option in
                                        Text(option)
                                    }
                                case "Ahorros":
                                    ForEach(vmAhorros.ahorrosPicker, id: \.self) {option in
                                        Text(option)
                                    }
                                default:
                                    Text("")
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding(.top)
                            
                            Spacer()
                            
                            VStack{
                                Button {
                                    vmRegistros.saveRegistro(tipo: motivo,
                                                            monto: vmCalculadora.textfieldValue, detalle: textFieldText,
                                                                fecha: date,
                                                                categoria: selected)
                                    vmRegistros.sumatoriaIngresos()
                                    vmRegistros.sumaIngresos = vmRegistros.sumarRegistrosPorTipo(tipo: .ingresos)
                                    vmRegistros.sumaAhorros = vmRegistros.sumarRegistrosPorTipo(tipo: .ahorros)
                                    vmRegistros.sumaGastos = vmRegistros.sumarRegistrosPorTipo(tipo: .gastos)
                                    vmCalculadora.autoGuardado.toggle()
                                    dismiss()
                                    
                                } label: {
                                    ButtonGeneralNavigation(color: .blue, text: "Listo")
                                        .opacity(textFieldText.count < 1 ? 0 : 1)
                                        .animation(.easeInOut(duration: 0.7),value: larger)
                                }.onAppear{
                                    larger = false
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
    RegistroPart2New(vmCalculadora: ViewModelCalculadora(), vmRegistros: RegistrosViewModel(), motivo: "Ingresos")
}
