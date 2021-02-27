//
//  ContentView.swift
//  Case Study
//
//  Created by Taha Çekin on 27.02.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
        List {
            
            Text("Games")
           
            
            
        }.navigationBarTitle("Games")
        
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
