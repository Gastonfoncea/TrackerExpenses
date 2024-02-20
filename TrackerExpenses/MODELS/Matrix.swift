//
//  Matrix.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 08/02/2024.
//

import Foundation
import SwiftUI

struct Matrix {
    var color:Color
    
    static let dataSection:[KeyboardButton] = [
        .init(title: "7", textColor: .blue, backGroundColor: .blue.opacity(0.2), type: .number(7)),
        .init(title: "8", textColor: .blue, backGroundColor: .blue.opacity(0.2), type: .number(8)),
        .init(title: "9", textColor: .blue, backGroundColor: .blue.opacity(0.2), type: .number(9)),
        .init(title: "/", textColor: .white, backGroundColor: .blue, type: .reset),
        .init(title: "4", textColor: .blue, backGroundColor: .blue.opacity(0.2), type: .number(4)),
        .init(title: "5", textColor: .blue, backGroundColor: .blue.opacity(0.2), type: .number(5)),
        .init(title: "6", textColor: .blue, backGroundColor: .blue.opacity(0.2), type: .number(6)),
        .init(title: "X", textColor: .white, backGroundColor: .blue, type: .operation(.multiplicacion)),
        .init(title: "1", textColor: .blue, backGroundColor: .blue.opacity(0.2), type: .number(1)),
        .init(title: "2", textColor: .blue, backGroundColor: .blue.opacity(0.2), type: .number(2)),
        .init(title: "3", textColor: .blue, backGroundColor: .blue.opacity(0.2), type: .number(3)),
        .init(title: "-", textColor: .white, backGroundColor: .blue, type: .reset),
        .init(title: "0", textColor: .blue, backGroundColor: .blue.opacity(0.2), type:.number(0)),
        .init(title: ",", textColor: .blue, backGroundColor: .blue.opacity(0.2), type: .reset),
        .init(title: "+", textColor: .white, backGroundColor: .blue, type: .operation(.suma)),
        .init(title: "=", textColor: .white, backGroundColor: .blue, type: .result),
    ]
    
    static let firstSectionGrid:(CGFloat) -> [GridItem] = {width in
        return Array(repeating:GridItem(.flexible(minimum: width),spacing: 0),count:4)
    }
}
