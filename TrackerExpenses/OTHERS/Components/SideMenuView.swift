//
//  SideMenuView.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 04/03/2024.
//

import SwiftUI

struct SideMenuView: View {
    
    @Binding var isShowing: Bool
    @State var selectedOption: SideMenuOptionModel?
    
    var body: some View {
        ZStack{
            if isShowing{
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture { isShowing.toggle() }
                
                HStack{
                    VStack(alignment:.leading, spacing: 32){
                        SideMenuHeader()
                        
                        ForEach(SideMenuOptionModel.allCases) {option in
                            SideMenuRowView(option: option)
                            
                            
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .frame(width: 270,alignment: .leading)
                    .background(.white)
                    Spacer()
                }

            }
            
        }
        .transition(.move(edge: .leading))
        .animation(.easeInOut,value: isShowing)
    }
}
    
#Preview {
    SideMenuView(isShowing: .constant(true))
}
