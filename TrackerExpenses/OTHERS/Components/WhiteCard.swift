//
//  FondoBlanco.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 23/02/2024.
//

import SwiftUI

struct WhiteCard: View {
    var body: some View {

            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .ignoresSafeArea(.all)
                .frame(height: 520)

    }
}

#Preview {
    WhiteCard()
}
