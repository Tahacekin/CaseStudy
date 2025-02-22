//
//  ViewModel.swift
//  Case Study
//
//  Created by Taha Çekin on 10.03.2021.
//

import SwiftUI


struct SearchBar:View {
    
    @Binding var text:String
    
    @State var isEditing = false
    
    var body: some View {
        HStack {
            TextField("Search For Games", text: $text)
                .padding(7)
                .padding(.horizontal , 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0 , maxWidth: .infinity , alignment: .leading).padding(.leading , 8)
                        
                        if isEditing {
                            
                            Button(action: {
                                
                                self.text = ""
                                
                                
                            }, label: {
                                Image(systemName: "multiply.circle.fill").foregroundColor(.gray).padding(.trailing , 8)
                                
                                
                                
                                
                            })
                            
                        }
                 
                    }
                    
                    
                )
                .padding(.horizontal , 10)
                .onTapGesture {
                    self.isEditing = true
                }
            
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }, label: {
                    Text("Cancel")
                }).padding(.trailing , 10).transition(.move(edge: .trailing)).animation(.default)
                
            }
            
            
        }
        
    }
    
}


struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}





