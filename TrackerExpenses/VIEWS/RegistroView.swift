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
    var motivo: String
    @Environment (\.dismiss) private var dismiss
    
    var body: some View {
        // MARK: HACER LA MISMA VISTA QUE EN REGISTRO PART 2 NEW
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Text("$ \(viewModelCalculadora.textfieldValue)")
                        .font(.system(size: 55))
                        .padding(.trailing,30)
                }
                .padding(.bottom,-150)

                Spacer()
                VerticalButtonStack(
                    viewModelCalculadora: viewModelCalculadora,
                    data: Matrix.dataSection, width: 400)
                .padding(.top,50)
                Spacer()
                
                NavigationLink(destination: RegistroPart2New(viewModelCalculadora: viewModelCalculadora, motivo: motivo)) {
                    ButtonGeneralNavigation(color: .blue, text: "Continuar")
                }
 
            }
            .navigationTitle(motivo)
            .onAppear{
                if viewModelCalculadora.autoGuardado == true {
                    dismiss()
                }
            }
    }
}

#Preview {
    RegistroView(motivo: "Comida")
}
