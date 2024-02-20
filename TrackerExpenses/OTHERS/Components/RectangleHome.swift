//
//  RectangleHome.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 08/02/2024.
//

import SwiftUI

struct RectangleHome: View {
    var body: some View {
        ZStack{
            Color.accentColor1
                .ignoresSafeArea(.all)
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(maxHeight: .infinity)
                .offset(y:200)
        }
    }
}

#Preview {
    RectangleHome()
}
