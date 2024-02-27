//
//  CardExpense.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 08/02/2024.
//

import SwiftUI

struct CardExpense: View {
    
    @ObservedObject var vmRegistros: RegistrosViewModel
    var color: Color
    var motivo: String
    var icono: String
    
    var body: some View {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(color.opacity(0.1))
                HStack{
                    Image(systemName: icono)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 30))
                        .foregroundStyle(color)
                    Spacer()
                    VStack(alignment:.leading){
                        Text(motivo)
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundStyle(color)
                        if motivo == "Ingresos" {
                            Text("$\(vmRegistros.sumaIngresos)")
                                .font(.system(size: 24))
                                .bold()
                                .padding(.top,2)
                                .foregroundStyle(color)
                        }else if motivo == "Gastos"{
                            Text("$\(vmRegistros.sumaGastos)")
                                .font(.system(size: 24))
                                .bold()
                                .padding(.top,2)
                                .foregroundStyle(color)
                        }else {
                            Text("$\(vmRegistros.sumaAhorros)")
                                .font(.system(size: 24))
                                .bold()
                                .padding(.top,2)
                                .foregroundStyle(color)
                        }
                    }
                    .frame(width: 150,alignment: .leading)
                    .padding(.leading)
                    .padding(.trailing,20)
                }
                .padding(.leading)
            }
            .frame(width: 270,height: 90)
   
    }
}

#Preview {
    CardExpense(vmRegistros: RegistrosViewModel(), color: .blue,motivo: "Ingresos", icono: "carrot.fill")
}
