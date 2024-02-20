//
//  ButtonPlus.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 08/02/2024.
//

import SwiftUI

struct ButtonPlus: View {
    var color: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(color)
            Image(systemName: "plus")
                .foregroundStyle(.white)
                .font(.system(size: 30))
        }
        .frame(width:60,height: 90)

    }
}

#Preview {
    ButtonPlus(color: .blue)
}
