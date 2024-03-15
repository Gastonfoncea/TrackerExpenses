//
//  SideMenuHeader.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 04/03/2024.
//

import SwiftUI

struct SideMenuHeader: View {
    var body: some View {
        HStack{
            Image(systemName: "person.circle.fill")
                .imageScale(.large)
                .foregroundStyle(.white)
                .frame(width: 48, height: 48)
                .background(.accentColor1)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.vertical)
            
            VStack(alignment:.leading, spacing: 6) {
                Text("Stephen Curry")
                    .font(.subheadline)
                
                Text("steph30@gmail.com")
                    .font(.footnote)
                    .tint(.gray)
            }
            
            
        }
    }
}

#Preview {
    SideMenuHeader()
}
