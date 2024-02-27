//
//  RegistroView.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 08/02/2024.
//

import SwiftUI

struct RegistroView: View {
    
    @StateObject var viewModelCalculadora = ViewModelCalculadora()
    @StateObject var viewModelTarjetas = TarjetasViewModel()
    @ObservedObject var vmRegistros: RegistrosViewModel
    var motivo: String
    @State private var larger = true
    @Environment (\.dismiss) private var dismiss
    
    var body: some View {
        // MARK: HACER LA MISMA VISTA QUE EN REGISTRO PART 2 NEW
        
        VStack{
            Color.accentColor1
                .ignoresSafeArea(.all)
                .overlay {/// aca creamos la vista del fondo azul----------------------
                    HStack{
                        Spacer()
                        Text("$ \(viewModelCalculadora.textfieldValue)")
                            .font(.system(size: 55))
                            .padding(.trailing,20)
                            .foregroundStyle(.white)
                        Button(action: {
                            if !viewModelCalculadora.textfieldValue.isEmpty{
                                viewModelCalculadora.textfieldValue = String(viewModelCalculadora.textfieldValue.dropLast())
                            }
                            
                        }, label: {
                            Image(systemName: "delete.backward.fill")
                                .font(.system(size: 35))
                                .foregroundStyle(.gray)
                                .padding(.trailing,10)
                        })
                       
                    }
                    .padding(.bottom,-150)
                }
            
            ZStack{
                    WhiteCard()
                    .overlay {
                        VStack{
                            VerticalButtonStack(
                                viewModelCalculadora: viewModelCalculadora,
                                data: Matrix.dataSection, width: 400)
                            .padding(.top,50)
                            Spacer()
                            NavigationLink(destination: RegistroPart2New(vmCalculadora: viewModelCalculadora, vmRegistros: vmRegistros, motivo: motivo)) {
                                ButtonGeneralNavigation(color: .blue, text: "Continuar")
                                    .opacity(viewModelCalculadora.textfieldValue.count < 1 ? 0 : 1)
                                    .animation(.easeInOut(duration: 0.5), value:larger)
                            }.onAppear{
                                larger = false
                            }
                        }
                    }
            }
        }
        .background(Color.accentColor1)
        .navigationTitle(motivo)
        .onAppear{
            if viewModelCalculadora.autoGuardado == true {
                dismiss()
            }
        }
    }
}

#Preview {
    RegistroView(vmRegistros: RegistrosViewModel(), motivo: "Comida")
}
