//
//  BeerPresenter.swift
//  BeerTap
//
//  Created by Alina Ene on 22/04/2020.
//  Copyright © 2020 Alina Ene. All rights reserved.
//

import Foundation

protocol BeerPresentable {
    var isFavourite: Bool { get set }
    var title: String { get }
    var abv: String { get }
    var imageUrl: URL? { get }
    var description: String { get }
    var foodPairings: String? { get }
    var maltIngredients: String? { get }
    var yeastIngredients: String? { get }
    var hopsIngredients: String? { get }
}

class BeerPresenter: BeerPresentable {
    
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
    
    var description: String {
        return beer.description
    }
    
    var foodPairings: String? {
        return beer.foodPairings?.joined(separator: " - ")
    }
    
    var maltIngredients: String? {
        var list: [String] = []
        if let maltList = beer.ingredients?.malt {
            for item in maltList {
                let itemString = item.name + " \(item.amount.value) \(item.amount.unit)"
                list.append(itemString)
            }
        }
        return list.joined(separator: ", ")
    }
    
    var yeastIngredients: String? {
        return beer.ingredients?.yeast
    }
    
    var hopsIngredients: String? {
        var list: [String] = []
        if let maltList = beer.ingredients?.hops {
            for item in maltList {
                let itemString = item.name + " \(item.amount.value) \(item.amount.unit)"
                list.append(itemString)
            }
        }
        return list.joined(separator: ", ")
    }
}
