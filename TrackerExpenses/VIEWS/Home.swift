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
    @StateObject var vmIngresos = IngresosViewModel()
    @State var sumaIngresos = 0
    @State var sumaGastos = 0
    @State var sumaAhorros = 0
    
    
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
                            
                            Text("$ \(vmRegistros.total)")
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
                                NavigationLink(destination: IngresosView(vmRegistros: vmRegistros)) {
                                    CardExpense(vmRegistros: vmRegistros, color: .blue, motivo: "Ingresos",icono: "dock.arrow.down.rectangle")
                                }
                             
                               
                                NavigationLink(destination: RegistroView(vmRegistros: vmRegistros, motivo: "Ingresos")) { ButtonPlus(color: .blue)
                                }
                            }
                            
                            HStack{
                                NavigationLink(destination: GastosView(vmRegistros: vmRegistros)){
                                    CardExpense(vmRegistros: vmRegistros, color: .red, motivo: "Gastos", icono: "takeoutbag.and.cup.and.straw.fill")
                                }
                                
                                NavigationLink(destination: RegistroView(vmRegistros: vmRegistros, motivo: "Gastos")) {
                                    ButtonPlus(color: .red)
                                }
                            }
                            
                            HStack{
                                NavigationLink(destination: AhorrosView( vmRegistros:vmRegistros)) {
                                    CardExpense(vmRegistros: vmRegistros, color: .yellow, motivo: "Ahorros", icono: "handbag.fill")
                                }
                                NavigationLink(destination: RegistroView(vmRegistros: vmRegistros, motivo: "Ahorros")) {
                                    ButtonPlus(color: .yellow)
                                }
                            }
                            
                            Text("\(vmRegistros.sumaIngresos)")
                        }
                        .offset(y:-200)
                    }
                }
                .offset(y:110)
            }
        }
        .onAppear{
            vmRegistros.sumatoriaIngresos()
            sumaIngresos = vmRegistros.sumarRegistrosPorTipo(tipo: .ingresos)
            sumaGastos = vmRegistros.sumarRegistrosPorTipo(tipo: .gastos)
            sumaAhorros = vmRegistros.sumarRegistrosPorTipo(tipo: .ahorros)
        }
    }
}
#Preview {
    Home(vmRegistros: RegistrosViewModel())
}
