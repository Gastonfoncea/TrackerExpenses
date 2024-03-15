//
//  SideMenuRowView.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 05/03/2024.
//

import SwiftUI

struct SideMenuRowView: View {
    let option: SideMenuOptionModel
    
    var body: some View {
        HStack{
            Image(systemName: option.image)
                .imageScale(.medium)
            
            Text(option.title)
                .font(.system(size: Apptheme.fontSizeSubTitles2 ))
            Spacer()
        }
        .padding(.leading)
        .frame(height: 44)
    }
}

#Preview {
    SideMenuRowView(option: .historial)
}
