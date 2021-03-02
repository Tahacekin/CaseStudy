//
//  ContentView.swift
//  Case Study
//
//  Created by Taha Çekin on 27.02.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var searchText = ""
    @State var isSearching = false
    
    var body: some View {
        NavigationView {
        
        ScrollView {
         
            HStack {
                HStack {
                
              TextField("Search for the Games", text: $searchText)
                .padding(.leading , 20)
                    
                } .padding()
                .background(Color(.systemGray3))
                .cornerRadius(15)
                .padding(.horizontal)
                .onTapGesture {
                    isSearching = true
                }
                .overlay(
                
                    HStack {
                       
                        
                        
                      Image(systemName: "magnifyingglass")
                      Spacer()
                      
                        if isSearching {
                            
                    Button(action: { searchText.removeAll() }, label: {
                     Image(systemName: "x.circle.fill")
                            })
                            
                           
                            
                        }
                        
                      
                        
                        
                    }
                    .padding(.horizontal, 23)
                    .foregroundColor(.gray)
                
            ) .transition(.move(edge: .trailing))
                .animation(.spring())
            
                if isSearching {
                
                    Button(action: { searchText.removeAll()
                        isSearching = false
                   
                    
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        
                    
                    }, label: {
                    Text("Cancel")
                        .padding(.trailing)
                        .padding(.leading , -1)
                })
                    .transition(.move(edge: .trailing))
                    .animation(.spring())
                
                }
            
            }
            
 
            
 ForEach((0..<21).filter({ "\($0)".contains(searchText) || searchText.isEmpty }) , id: \.self) { num in
        
        HStack {
        Text(String(num))
        Spacer()
        }
        .padding()
        
        
        Divider()
                
                
    } .navigationBarTitle("Games")
        
        }
        
     }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
