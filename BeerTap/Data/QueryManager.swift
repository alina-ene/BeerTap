//
//  QueryManager.swift
//  BeerTap
//
//  Created by Alina Ene on 22/04/2020.
//  Copyright © 2020 Alina Ene. All rights reserved.
//

import Foundation
import Alamofire

enum BeerTapUrl: String {
    case baseUrl = "https://api.punkapi.com/v2/"
}

class QueryManager {

    typealias BeerQueryResult = ([Beer]?, String?) -> Void
    
    //pagination https://api.punkapi.com/v2/beers?page=2&per_page=30
    func loadBeerList(page: Int, pageCount: Int, completion: @escaping BeerQueryResult) {
//        Alamofire
    }
}
