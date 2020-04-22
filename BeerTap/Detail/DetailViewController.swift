//
//  DetailViewController.swift
//  BeerTap
//
//  Created by Alina Ene on 22/04/2020.
//  Copyright © 2020 Alina Ene. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, Storyboarded {
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var abvLabel: UILabel!
    @IBOutlet private var iconImageView: UIImageView!
    @IBOutlet private var descriptionLabel: UILabel!
    
    var presenter: BeerPresentable!
    
    private lazy var button: UIButton = {
        let button: UIButton = UIButton(type: .custom)
        button.setImage(UIImage(named: "star")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.addTarget(self, action: #selector(toggleFav), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = barButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleLabel.text = presenter.title
        abvLabel.text = presenter.abv
        if let url = presenter.imageUrl {
            iconImageView.af.setImage(withURL: url)
        }
        descriptionLabel.text = presenter.description
        button.tintColor = presenter.isFavourite ? .orange : .gray
    }
    
    @objc func toggleFav() {
        presenter.isFavourite = !presenter.isFavourite
        button.tintColor = presenter.isFavourite ? .orange : .gray
    }
}
