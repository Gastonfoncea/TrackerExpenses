//
//  VerticalButtonStack.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 08/02/2024.
//

import SwiftUI

struct VerticalButtonStack: View {
    
    @ObservedObject var viewModelCalculadora : ViewModelCalculadora
    let data:[KeyboardButton]
    let columns = [
        GridItem(.flexible(minimum: 80, maximum: 80)),
        GridItem(.flexible(minimum: 80, maximum: 80)),
        GridItem(.flexible(minimum: 80, maximum: 80)),
        GridItem(.flexible(minimum: 80, maximum: 80))
    ]
    let width: CGFloat
    
    init(viewModelCalculadora: ViewModelCalculadora, data: [KeyboardButton], width: CGFloat) {
        self.viewModelCalculadora = viewModelCalculadora
        self.data = data
        self.width = width
    }
    
    var body: some View {
        LazyVGrid(columns:columns ,spacing: 15) {
            ForEach(data, id: \.self) {item in
                Button(action: {
                    viewModelCalculadora.logic(key: item)
                }, label: {
                    Text(item.title)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(width:width * 0.17,height: width * 0.17)
                    
                })
                .foregroundStyle(item.textColor)
                .background(item.backGroundColor) ///hacer una variable y que pase el color la vista RegistroView dependiendo de la categoria seleciconada
                .cornerRadius(width * 0.25)
                
            }
        }
        .frame(width: width)
    }
}

#Preview {
    VerticalButtonStack(viewModelCalculadora: ViewModelCalculadora(), data: Matrix.dataSection, width:390)
        .previewLayout(.sizeThatFits)
}
