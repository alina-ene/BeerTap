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
    var sectionTitle: String { get }
    var stateMessage: String { get }
    var refreshControlMessage: String { get }
    func beerPresenter(at index: Int) -> BeerPresentable?
    func refreshList()
    var beerList: [Beer] { get set }
    var queryManager: QueryManager { get set }
    var coordinator: AppCoordinator? { get set }
    func selectRow(at index: Int)
}

enum ListViewState {
    case resultsLoaded
    case loading
    case error
}

class ListViewPresenter: ListViewPresentable {
    var coordinator: AppCoordinator?
    
    var queryManager: QueryManager
    var beerList: [Beer] = [] {
        didSet {
            coordinator?.reloadList()
        }
    }
    
    var rowCount: Int {
        return beerList.count
    }
    
    var sectionTitle = "Beer Tap"
    var refreshControlMessage = "Pull to refresh"
    var stateMessage: String = ""
    
    var state: ListViewState = .loading {
        didSet {
            stateMessage = stateMessage(state)
            coordinator?.updateStateFeedback()
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
    
    init(queryManager: QueryManager) {
        self.queryManager = queryManager
    }

    func refreshList() {
        state = .loading
        queryManager.loadBeerList { (beers: [Beer]?, errorMessage: String?) in
            if let list = beers {
                self.beerList = list
                self.state = .resultsLoaded
            }
            if let _ = errorMessage {
                self.state = .error
            }
        }
    }
    
    func beerPresenter(at index: Int) -> BeerPresentable? {
        if index > -1 && index < rowCount {
            return BeerPresenter(beer: beerList[index])
        }
        return nil
    }
    
    func selectRow(at index: Int) {
        if let presenter = beerPresenter(at: index) {
            coordinator?.launchDetailScreen(beerPresenter: presenter)
        }
    }
}
