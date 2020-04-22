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
//    let tagline: String
//    let firstBrewed: String
    let abv: Double
//    let ibu: Double
    let icon: String
    let description: String
//    let foodPairings: [String]?
//    let brewersTips: String?
//    let contributor: String?
//    let ingredients: BeerIngredients?
//    let method: Method
//    let boil_volume: Amount
//    let volume: Amount
//    let attenuation_level: Int
//    let ph: Double
//    let ebc: Double
//    let srm: Double
//    let target_fg: Double
//    let target_og: Double
    
    enum CodingKeys: String, CodingKey {
        case id, name, abv, description//, tagline, abv, ibu, description, ingredients, attenuation_level, srm, ph, ebc, target_fg, target_og, boil_volume, volume, method
//        case contributor = "contributed_by"
//        case brewersTips = "brewers_tips"
//        case foodPairings = "food_pairing"
        case icon = "image_url"
//        case firstBrewed = "first_brewed"
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

struct Method: Decodable {
    let mash_temp: MashTemp
    let fermentation: Fermentation
    let twist: String?
}

struct Fermentation: Decodable {
    let temp: Amount
}

struct MashTemp: Decodable {
    let temp: Amount
    let duration: Int?
}
