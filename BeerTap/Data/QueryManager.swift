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
    case baseUrl = "https://api.punkapi.com/v2/beers"
}

class QueryManager {

    typealias BeerQueryResult = ([Beer]?, String?) -> Void
    
    func loadBeerList(page: Int = 1, pageCount: Int = 30, completion: @escaping BeerQueryResult) {
        let parameters = ["page": page.description, "per_page": pageCount.description]
        AF.request(BeerTapUrl.baseUrl.rawValue, parameters: parameters)
    .validate()
        .responseDecodable(of: [FailableDecodable<Beer>].self) { (response) in
          guard let throwables = response.value else {
            completion(nil, "error")
            return
            }
            completion(throwables.compactMap { $0.base }, nil)
        }
    }
}
