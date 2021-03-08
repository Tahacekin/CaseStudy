//
//  DataView.swift
//  Case Study
//
//  Created by Taha Çekin on 27.02.2021.
//

import SwiftUI






struct DataView: View {
    
    @State var posts:[Post] = []
    
    var body: some View {
        
        List(posts , id: \.id ) { post in
            VStack(alignment: .leading) {
                Text(post.name)
                Text(post.description)
            }
            
        }.onAppear {
            Api().getPosts { (posts) in
                self.posts = posts
            }
        }
        
        
    }
    
    
    
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
