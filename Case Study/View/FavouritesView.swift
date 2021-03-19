//
//  FavouritesView.swift
//  Case Study
//
//  Created by Taha Çekin on 27.02.2021.
//

import SwiftUI

struct FavouritesView: View {
  
    @State var test = Results(id: 1, name: "", metacritic: 1, background_image: "")
    @ObservedObject var fav = Fav()
    
    var body: some View {
        
        NavigationView {
        
            
            // Going to fill
            
            List() {
                
                
                NavigationLink(
                    destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                    label: {
                        Text("Test")
                    
                    
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
