//
//  Beer.swift
//  BeerTap
//
//  Created by Alina Ene on 22/04/2020.
//  Copyright © 2020 Alina Ene. All rights reserved.
//

import UIKit

struct FailableDecodable<Beer : Decodable> : Decodable {

    let base: Beer?

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.base = try? container.decode(Beer.self)
    }
}

struct Beer: Decodable {
    let id: Int
    let name: String
    let abv: Double
    let icon: String
    let description: String
    let foodPairings: [String]?
    let ingredients: BeerIngredients?
    
    enum CodingKeys: String, CodingKey {
        case id, name, abv, description, ingredients
        case foodPairings = "food_pairing"
        case icon = "image_url"
    }
}

struct BeerIngredients: Decodable {
    let malt: [Ingredient]
    let hops: [Ingredient]
    let yeast: String
}

struct Ingredient: Decodable {
    let name: String
    let amount: Amount
    let add: String?
    let attribute: String?
}

struct Amount: Decodable {
    let value: Double
    let unit: String
}
