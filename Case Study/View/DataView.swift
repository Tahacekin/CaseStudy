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
    @Environment(\.openURL) var openURL
    @State var tset = Results(id: 1, name: "", metacritic: 1, background_image: "")
    @State var postsS = Post(id: 1, name: "", description: "", reddit_url: "", website: "", background_image: "")
    @State var ltus = [Post]()
    @EnvironmentObject var fav: Fav
    var body: some View {
        
        ScrollView {
            
            
            VStack(alignment: .leading) {
                
                ZStack {
                    
                    
                    // Maybe I will have to us a enum coding key
                    Image(uiImage: postsS.background_image.load2()).resizable()
                        //.frame(width: 500 , height: 400)
                        .scaledToFit()
                    
                    Text(postsS.name)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .padding(.top)
                }
                
                
                
                
                
                Divider()
                
                VStack {
                    Text("Game Description")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding([.top, .leading, .trailing])
                    
                    
                    Text("" + postsS.description)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding()
                        
                }.onAppear(perform: {
                    Api().getPosts { (post) in
                        self.postsS = post
                    }
                })
                .toolbar(content: {
                    Button(fav.contains(tset) ? "Remove from Favorites" : "Add to Favorites") {
                        if self.fav.contains(self.tset) {
                            self.fav.removeGame(self.tset)
                        } else {
                            self.fav.add(self.tset)
                        }
                    }
                    .padding()

                })
                    
                }
                
              
            
            
            Divider()
            
            VStack {
                Button("Visit Reddit") {
                    
                    openURL(URL(string: postsS.reddit_url)!)
                    
                }
                .padding(.vertical)
                Divider()
                
                Button("Visit Website") {
                    openURL(URL(string: postsS.website)!)
                    
                }
                .padding(.vertical)
                
                
                
            }
            .padding(.vertical)
            
            
            
        }
        
        
        
        
        
    }
}





struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        DataView()
    }
}
