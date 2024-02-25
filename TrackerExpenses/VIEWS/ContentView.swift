//
//  ContentView.swift
//  TrackerExpenses
//
//  Created by Gaston Foncea on 25/02/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Home()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                
            Historial()
                .tabItem {
                    Label("Historial", systemImage: "clock.arrow.circlepath")
                }
            
            Profile()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
        
    }
}

#Preview {
    ContentView()
}
