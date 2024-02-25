//
//  Engine.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 22/02/2024.
//

import Foundation

protocol CarDelegate {
    func didStarEngine(asd: String)
}

class Engine: CarDelegate {
    
    func didStarEngine(asd: String) {
        if asd == "bad" {
            self.checkEngine()
        }
    }
    
    func checkEngine() {
        // most check engine
    }
}
