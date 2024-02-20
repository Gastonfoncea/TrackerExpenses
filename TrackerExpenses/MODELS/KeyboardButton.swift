//
//  KeyboardButton.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 08/02/2024.
//

import Foundation
import SwiftUI


struct KeyboardButton: Hashable {
    let title:String
    let textColor: Color
    let backGroundColor: Color
    let type: ButtonType
}

enum ButtonType:Hashable {
    case number(Int)
    case operation(OperationType)
    case result
    case reset
}

enum OperationType:Hashable {
    case suma
    case multiplicacion
}
