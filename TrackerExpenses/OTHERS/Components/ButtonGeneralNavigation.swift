//
//  ButtonGeneralNavigation.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 10/02/2024.
//

import SwiftUI

struct ButtonGeneralNavigation: View {
    var color: Color
    var text: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 6)
                .foregroundStyle(color.opacity(1))
            Text(text)
                .font(.system(size: 20))
                .foregroundStyle(.white)
                .bold()
        }
        .frame(maxWidth:.infinity)
        .frame(height: 55)
        .padding()
    }
}

#Preview {
    ButtonGeneralNavigation(color: Color.blue, text: "Continuar")
}
