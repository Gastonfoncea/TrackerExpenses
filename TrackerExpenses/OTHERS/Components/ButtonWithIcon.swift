//
//  ButtonWithIcon.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 04/03/2024.
//

import SwiftUI

struct ButtonWithIcon: View {
    
    var icon: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: icon)
                .font(.system(size: 23))
                .foregroundStyle(.white)
                .bold()
        }

    }
}

#Preview {
    ButtonWithIcon(icon:"house.fill") {
        
    }
}
