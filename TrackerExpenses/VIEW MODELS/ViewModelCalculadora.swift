//
//  ViewModelCalculadora.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 10/02/2024.
//

import Foundation


final class ViewModelCalculadora: ObservableObject {

    
    @Published var textfieldValue: String = ""
    @Published var autoGuardado:Bool = false
    
    var textFieldSavedValue: String = "0"
    var currentOperationToExecute: OperationType?
    var shouldRunOperation: Bool = false
    
    func logic(key:KeyboardButton) {
        
        switch key.type {
            
        case .number(let value):
            if shouldRunOperation {
                textfieldValue = "0"
            }
            textfieldValue = textfieldValue == "0" ? "\(value)" : textfieldValue + "\(value)"
            
        case .reset:
            textfieldValue = "0"
            textFieldSavedValue = "0"
            currentOperationToExecute = nil
            shouldRunOperation = false
            
        case .result:
            guard let operation = currentOperationToExecute else {
                return
            }
            
            switch operation {
            case .suma:
                textfieldValue = "\(Int(textfieldValue)! + Int(textFieldSavedValue)!)"
                
            case .multiplicacion:
                textfieldValue = "\(Int(textfieldValue)! * Int(textFieldSavedValue)!)"
                
            }
            
        case .operation(let type):
            
            textFieldSavedValue = textfieldValue
            currentOperationToExecute = type
            shouldRunOperation = true
            
        }
        
    }
    
}
