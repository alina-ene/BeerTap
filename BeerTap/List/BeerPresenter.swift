//
//  BeerPresenter.swift
//  BeerTap
//
//  Created by Alina Ene on 22/04/2020.
//  Copyright © 2020 Alina Ene. All rights reserved.
//

import Foundation

class BeerPresenter {
    
    private let beer: Beer
    
    init(beer: Beer) {
        self.beer = beer
    }
    
    var isFavourite: Bool {
        get {
            return UserDefaults.standard.bool(forKey: beer.id.description)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: beer.id.description)
        }
    }
    
    var title: String {
        return beer.name.capitalized
    }
    
    var abv: String {
        return beer.abv.description + "%"
    }
    
    var imageUrl: URL? {
        return URL(string: beer.icon)
    }
}
