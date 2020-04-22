//
//  ListViewController.swift
//  BeerTap
//
//  Created by Alina Ene on 22/04/2020.
//  Copyright © 2020 Alina Ene. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, Storyboarded {

    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var messageLabel: UILabel!
    var presenter: ListViewPresentable!
    private var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        title = presenter.sectionTitle
        
        refreshControl.attributedTitle = NSAttributedString(string: presenter.refreshControlMessage)
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
        
        presenter.refreshList()
        updateStateFeedback()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    @objc func refresh(_ sender: Any) {
        presenter.refreshList()
    }
    
    func updateStateFeedback() {
        refreshControl.endRefreshing()
        messageLabel.text = presenter.stateMessage
    }

    func reloadList() {
        refreshControl.endRefreshing()
        tableView.reloadData()
    }
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.selectRow(at: indexPath.row)
    }
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: BeerTableViewCell.identifier, for: indexPath) as? BeerTableViewCell {
            cell.beerPresenter = presenter.beerPresenter(at: indexPath.row)
           return cell
        }
        
        return UITableViewCell()
    }
    
    
}

