//
//  TabView.swift
//  Case Study
//
//  Created by Taha Çekin on 27.02.2021.
//

import SwiftUI

struct CSTabView: View {
    
    @State var index = 0
    
    var body: some View {
        
       
        TabView(selection: $index) {
            
          ContentView()
            .tabItem {
                
                
                Image(systemName: "gamecontroller")
                Text("Games")
                
            }
            .tag(0)
            
            
           FavouritesView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favourites")
                    
                    
                }
                .tag(1)
            
            
            
            
        }
    
    
    
    
    
    }
    
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        CSTabView()
    }
}
