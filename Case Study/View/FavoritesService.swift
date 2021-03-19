//
//  FavoritesService.swift
//  Case Study
//
//  Created by Taha Çekin on 17.03.2021.
//

import SwiftUI


class Fav: ObservableObject {
    
    private var games: Set <Int>
    private let saveKey = "Favorites"

    init() {
        self.games = []
    }

    
    func contains(_ game: Results) -> Bool {
        self.games.contains(game.id)
        
    }
    
    func add(_ game: Results) {
        
        objectWillChange.send()
        games.insert(game.id)
        save()
    }
    
    func removeGame(_ game:Results) {
        objectWillChange.send()
        games.remove(game.id)
        save()
        
    }

    
    func save() {
        //esults.self
        
        
    }
    
}
