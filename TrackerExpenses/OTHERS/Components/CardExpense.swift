//
//  CardExpense.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 08/02/2024.
//

import SwiftUI

struct CardExpense: View {
    var color: Color
    var motivo: String
    var monto: Int
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
                        Text("$\(monto)")
                            .font(.system(size: 24))
                            .bold()
                            .padding(.top,2)
                            .foregroundStyle(color)
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
    CardExpense(color: .blue,motivo: "Ingresos",monto: 40000, icono: "carrot.fill")
}
