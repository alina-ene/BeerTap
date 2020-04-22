//
//  Beer.swift
//  BeerTap
//
//  Created by Alina Ene on 22/04/2020.
//  Copyright © 2020 Alina Ene. All rights reserved.
//

import UIKit

struct Beer: Codable {
    let id: Int
    let name: String
    let abv: Int
    let icon: String
    let description: String
    let foodPairings: [String]?
    let brewersTips: String?
    let contributor: String?
    let ingredients: BeerIngredients?
    
    enum CodingKeys: String, CodingKey {
        case id, name, abv,description, ingredients
        case contributor = "contributed_by"
        case brewersTips = "brewers_tips"
        case foodPairings = "food_pairing"
        case icon = "image_url"
    }
}

struct BeerIngredients: Codable {
    let malt: [Ingredient]
    let hops: [Ingredient]
    let yeast: String
}

struct Ingredient: Codable {
    let name: String
    let amount: Amount
    let add: String?
    let attribute: String?
}

struct Amount: Codable {
    let value: Double
    let unit: String
}
