//
//  ListViewPresenter.swift
//  BeerTap
//
//  Created by Alina Ene on 22/04/2020.
//  Copyright © 2020 Alina Ene. All rights reserved.
//

import Foundation

protocol ListViewPresentable {
    var rowCount: Int { get }
   // func text(for rowIndex: Int) -> String?
    var sectionTitle: String { get }
    var stateMessage: String { get }
    var refreshControlMessage: String { get }
    //func showDetail(for rowIndex: Int)
    func refreshList()
    var beerList: [Beer] { get set }
//    var queryManager: QueryManager { get set }
    //var coordinator: AppCoordinator? { get set }
}

enum ListViewState {
    case resultsLoaded
    case loading
    case error
}

class ListViewPresenter: ListViewPresentable {
    var beerList: [Beer] = []
    
    var rowCount: Int {
        return beerList.count
    }
    
    var sectionTitle = "Beer Tap"
    var refreshControlMessage = "Pull to refresh"
    var stateMessage: String = ""
    
    var state: ListViewState = .loading {
        didSet {
            stateMessage = stateMessage(state)
//            coordinator?.updateStateFeedback()
        }
    }
    
    func stateMessage(_ state: ListViewState) -> String {
        switch state {
        case .resultsLoaded:
            return refreshControlMessage
        case .loading:
            return "Loading..."
        case .error:
            return "Something went wrong. Pull to refresh"
        }
    }

    func refreshList() {
        state = .loading
//        queryManager.loadFruitList { (fruitBasket: FruitBasket?, errorMessage: String?) in
//            if let basket = fruitBasket {
//                self.fruitList = basket.fruit
//                self.state = .resultsLoaded
//            }
//            if let _ = errorMessage {
//                self.state = .error
//            }
//        }
    }
}
