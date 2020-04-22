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
        AF.request(BeerTapUrl.baseUrl.rawValue, parameters: parameters) { urlRequest in
            urlRequest.timeoutInterval = 5
            urlRequest.allowsConstrainedNetworkAccess = false
        }
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .responseData { response in
            
            var errorMessage: String?
            var beers: [Beer]?
            
            switch response.result {
            case .success:
                print("Validation Successful")
                do {
                    beers = try JSONDecoder().decode([Beer].self, from: response.data ?? Data())
                } catch let parseError as NSError {
                    errorMessage = parseError.localizedDescription
                }
            case let .failure(error):
                print(error)
                errorMessage = error.localizedDescription
            }
            completion(beers, errorMessage)
        }
    }
}
