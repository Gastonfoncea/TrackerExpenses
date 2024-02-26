//
//  Home.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 07/02/2024.
//

import SwiftUI
import SwiftData

struct Home: View {
    
    @StateObject var tarjetasViewModel = TarjetasViewModel()
    @StateObject var vmRegistros = RegistrosViewModel()
    @Environment(\.modelContext) var context
    @StateObject var vmIngresos = IngresosViewModel()
    
    @Query(filter: #Predicate<Registros>{$0.tipo == "Ingresos" },sort:\Registros.fecha) var registrosI: [Registros]
    @Query(filter: #Predicate<Registros>{$0.tipo == "Gastos"}, sort: \Registros.fecha) var registrosG: [Registros]
    @Query(filter: #Predicate<Registros> {$0.tipo == "Ahorros"}, sort: \Registros.fecha) var registrosA: [Registros]
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    Color.accentColor1
                        .frame(height: 700)
                        .ignoresSafeArea(.all)
                    VStack{
                        
                        HStack{
                            Text(tarjetasViewModel.getFormattedDate())
                                .foregroundStyle(.white)
                                .bold()
                            Spacer()
                        }
                        .padding(.bottom,5)
                        
                        HStack{
                            Text("Balance Mensual")
                                .font(.system(size: Apptheme.fontSizeSubTitles2))
                                .foregroundStyle(.white)
                                .bold()
                            Spacer()
                        }
                        .padding(.top,10)
                        
                        HStack {
                            //let ingresos = tarjetasViewModel.calcularSuma(registros:registrosI)
                            //let gastos = tarjetasViewModel.calcularSuma(registros:registrosG)
                            //let _ = ingresos - gastos
                     
                            Text("$ \(vmRegistros.sumatoriaIngresos())")
                                .font(.system(size: 40))
                                .foregroundStyle(Color.white)
                                .bold()
                            Spacer()
                        }
                        .padding(.top,5)
                    }
                    .padding(.horizontal,30)
                    .offset(y:100)
                }
               .frame(height: 150)
               
                ScrollView{
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .frame(height: 800)
                        
                        VStack{
                            HStack{
                                Text("Detalle Mensual")
                                    .padding(.leading,30)
                                    .padding(.bottom)
                                    .font(.system(size: Apptheme.fontSizeSubTitles2))
                                    .bold()
                                Spacer()
                            }
                            
                            HStack{
                                NavigationLink(destination: IngresosView()) {
                                    CardExpense(color: .blue, motivo: "Ingresos", monto: tarjetasViewModel.calcularSuma(registros:registrosI), icono: "dock.arrow.down.rectangle")
                                }
                                .onTapGesture {
                                    vmIngresos.ingresos = vmRegistros.fetchRegistros(tipo: .ingresos)
                                }
                               
                                NavigationLink(destination: RegistroView(motivo: "Ingresos")) { ButtonPlus(color: .blue)
                                }
                            }
                            
                            HStack{
                                NavigationLink(destination: GastosView()){
                                    CardExpense(color: .red, motivo: "Gastos", monto: tarjetasViewModel.calcularSuma(registros:registrosG), icono: "takeoutbag.and.cup.and.straw.fill")
                                }
                                
                                NavigationLink(destination: RegistroView(motivo: "Gastos")) {
                                    ButtonPlus(color: .red)
                                }
                            }
                            
                            HStack{
                                NavigationLink(destination: AhorrosView()) {
                                    CardExpense(color: .yellow, motivo: "Ahorros", monto: tarjetasViewModel.calcularSuma(registros:registrosA), icono: "handbag.fill")
                                }
                                NavigationLink(destination: RegistroView(motivo: "Ahorros")) {
                                    ButtonPlus(color: .yellow)
                                }
                            }
                        }
                        .offset(y:-200)
                    }
                }
                .offset(y:110)
            }
        }
    }
}
#Preview {
    Home()
}
