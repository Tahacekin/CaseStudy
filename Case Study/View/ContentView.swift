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



struct Results: Codable , Identifiable{
    var id:Int
    var name:String
    var metacritic:Int
    var background_image:String
      

    }
    

struct ContentView: View {
   
    @State var test = Results(id: 1, name: "", metacritic: 1, background_image: "")
    @State var gameData = [Results]()
    @State var searchText = ""
    @State var isEmpty = false
    @ObservedObject var fav = Fav()
    
    var body: some View {

        
        // Commented the SearchBar put because another tab emrges when I put it here 
        
        
        //SearchBar(text: $searchText)
            //.padding(.top , -30)
        
        VStack(alignment: .leading) {
            
            Text("Games")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.leading)
                .padding([.top, .leading])
            
            SearchBar(text: $searchText)
            NavigationView {
            
                

                
                
                ScrollView {
                    
                   
                    
    ForEach(gameData.filter({searchText.isEmpty ? true : $0.name.contains(searchText)}) , id: \.id) { item in
                        NavigationLink(
                            destination: DataView(),
                            label: {
                                HStack(alignment: .center) {
                                   
                                    Image(uiImage: item.background_image.load())
                                        .resizable()
                                        .frame(width: 175 , height: 100)
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.black)
                                        Spacer()
                                        
                                        HStack(alignment: .center) {
                                        
                                            Text("Metacritic:")
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.black)
                                            
                                        Text(String(item.metacritic))
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.red)
                                        }
                                        
                                    }
                                    
                                
                                }
                           
        if self.fav.contains(test) {
            Spacer()
            Image(systemName: "heart.fill")
                .accessibility(label: Text("This is a favorite resort"))
                .foregroundColor(.red)
        }

                            
                            
                            })
                        
                        
                    }
                    .padding([.top, .leading, .trailing])
                    .onAppear(perform: {
                        loadData()
                    })
                    
                    
                }
                
               

            
            
            
            }.environmentObject(fav)
        
        
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
