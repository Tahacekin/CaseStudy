//
//  Post.swift
//  Case Study
//
//  Created by Taha Çekin on 8.03.2021.
//

import SwiftUI

struct Post: Codable {
    var id:Int
    var name:String
    var description:String
    
    
}

class Api {
    
    func getPosts(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://api.rawg.io/api/games/3498") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
       
            DispatchQueue.main.async {
                completion(posts)
            }
        
        
        
        }.resume()
    }
    
    
    
}


