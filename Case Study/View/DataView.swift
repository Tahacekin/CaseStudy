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
    @State var postsS = Post(id: 1, name: "", description: "")
    @State var ltus = [Post]()
    
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
            
        }
        
        
        
        
    }
    }
    
    
    


struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        
       
        DataView()
    }
}
