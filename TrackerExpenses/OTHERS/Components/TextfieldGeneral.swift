//
//  TextfieldGeneral.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 10/02/2024.
//

import SwiftUI


///Textfield creado para importar desde otra hoja, se borro el preview por que da error la variable que es Binding, pero funciona correctamente

struct TextfieldGeneral: View {
    let nombreTextfield: String
    @Binding var referencia: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 6)
                .fill(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )
            TextField(nombreTextfield, text: $referencia)
                .padding(.leading)
        }
        .frame(maxWidth:.infinity)
        .frame(height: 55)
        .padding()
    }
}
//
//#Preview {
//    TextfieldGeneral(nombreTextfield: "Escribi una descripcion del ingreso", referencia: $referencia)
//}
