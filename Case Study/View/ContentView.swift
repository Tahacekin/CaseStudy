//
//  ContentView.swift
//  Case Study
//
//  Created by Taha Çekin on 27.02.2021.
//

import SwiftUI


extension String {
    
    func load() -> UIImage {
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


struct Response: Codable {
    var results:[Results]
}



struct Results: Codable {
    var id:Int
    var name:String
    var metacritic:Int
    var background_image:String
      

    }
    

struct ContentView: View {
    @State var gameData = [Results]()
   
    
    var body: some View {
        
        NavigationView {
        
            List(gameData , id: \.id) { item in
                
                
                HStack() {
                   
                    Image(uiImage: item.background_image.load())
                        .resizable()
                        .frame(width: 175 , height: 100)
                    
                    
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                            .fontWeight(.bold)
                        Spacer()
                        
                        HStack {
                        
                        Text("Metacritic:")
                            
                        Text(String(item.metacritic))
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.red)
                        }
                        
                    }
                    
                
                }
            }.onAppear(perform: {
                loadData()
            })
            .navigationBarTitle("Games")

        
        
        
     }
    
    }
    
    func loadData() {
        guard let url = URL(string: "https://api.rawg.io/api/games?page_size=10&page=1") else {
            
            print("Invalid URL")
            return }
    
        let request = URLRequest(url: url)
    
        
  URLSession.shared.dataTask(with: request) { data , response , error in
            
    if let data = data {
        
        
        if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
            DispatchQueue.main.async {
                self.gameData = decodedResponse.results
            }
            return
        }
        
    }
    print("Fetch failed: \(error?.localizedDescription ?? "Unkown error")")
  }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
