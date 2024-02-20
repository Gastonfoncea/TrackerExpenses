//
//  ListItems.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 08/02/2024.
//

import SwiftUI

struct ListItems: View {
    @StateObject var viewModel = TarjetasViewModel()
    var name: String
    var motivo: String
    var fecha: Date
    var monto: Int
    var color: Color
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.gray.opacity(0.2), lineWidth: 0.9)
                )
              //  .shadow(color:.gray.opacity(0.1),radius: 10)
            HStack{
                VStack(alignment:.leading,spacing: 6){
                    Text(name)
                        .font(.subheadline)
                        .bold()
                        .lineLimit(1)
                    Text(motivo)
                        .font(.footnote)
                        .opacity(0.7)
                        .lineLimit(1)
                    
                    Text(DateString(fecha: fecha))
                        .font(.footnote)
                        .opacity(0.7)
                        .lineLimit(1)
                }
                Spacer()
                Text("$\(monto)")
                    .foregroundStyle(color)
                    .bold()
                
            }
            .padding(.horizontal)
        }
        .frame(height: 90)
        .frame(maxWidth:.infinity)
       // .padding(.horizontal)
        
        
    }
    
    func DateString(fecha:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateString = dateFormatter.string(from: fecha)
        return dateString
        
    }
}
//
//#Preview {
//    ListItems(name: "Ingreso Sueldo", motivo: "Ingresos", fecha: Calendar.current.date(from: .==(lhs: <#T##DateComponents#>, rhs: <#T##DateComponents#>)), monto: 105000)
//}
