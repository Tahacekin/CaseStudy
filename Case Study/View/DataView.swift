//
//  DataView.swift
//  Case Study
//
//  Created by Taha Çekin on 27.02.2021.
//

import SwiftUI






struct DataView: View {
    
     @State var postsS:Post
    
    var body: some View {
       
        VStack {
        Text(postsS.name)
        Text(postsS.description)
        }.onAppear(perform: {
            Api().getPosts { (post) in
                self.postsS = post
            }
        })
        
    }
    }
    
    
    


struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = Api()
        DataView(postsS: model.p[0])
    }
}
