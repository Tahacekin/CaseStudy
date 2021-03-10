//
//  FavouritesView.swift
//  Case Study
//
//  Created by Taha Çekin on 27.02.2021.
//

import SwiftUI

struct FavouritesView: View {
    @State var gameDtt = [Results]()
    
    var body: some View {
        
        NavigationView {
        
            List(gameDtt , id: \.id) { pp in
            
            NavigationLink(
                destination: DataView(),
                label: {
                    ContentView()
                })
            
            
            
            
        }.navigationBarTitle("Favourites")
    
        }
    
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
