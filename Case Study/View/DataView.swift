//
//  DataView.swift
//  Case Study
//
//  Created by Taha Çekin on 27.02.2021.
//

import SwiftUI


extension String {
    
    func load2() -> UIImage {
        do {
            
            guard  let url = URL(string: self)  else {
                return UIImage()
            }
            let data: Data = try Data(contentsOf: url)
            return UIImage(data: data)
            ?? UIImage()
        }
        catch {
            print(error)
        }

        return UIImage()
        
        
        
           
    }
}








struct DataView: View {
    
    // need to somehow match the Models 
    
    @State var tset = Results(id: 1, name: "", metacritic: 1, background_image: "")
    @State var postsS = Post(id: 1, name: "", description: "")
    @State var ltus = [Post]()
    @EnvironmentObject var fav: Fav
    var body: some View {
       
        ScrollView {
            
        
            VStack(alignment: .leading) {
                
                ZStack {
                    
                    
                    // Maybe I will have to us a enum coding key
                    
                    
                    Text(postsS.name)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding([.leading, .bottom, .trailing])
                }
                
                
                
                
                
                Divider()
                
                Text(postsS.description)
                    .font(.body)
                    .padding([.top, .leading, .trailing])
            }.onAppear(perform: {
                Api().getPosts { (post) in
                    self.postsS = post
                }
            })
            
        
            Button(fav.contains(tset) ? "Remove from Favorites" : "Add to Favorites") {
                if self.fav.contains(self.tset) {
                    self.fav.removeGame(self.tset)
                } else {
                    self.fav.add(self.tset)
                }
            }
            .padding()
        
        
        }
        
        
        
        
        
    }
    }
    
    
    


struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        
       
        DataView()
    }
}
