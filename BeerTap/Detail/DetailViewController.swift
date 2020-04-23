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
    @IBOutlet private var foodPairingsLabel: UILabel!
    @IBOutlet private var maltLabel: UILabel!
    @IBOutlet private var hopsLabel: UILabel!
    @IBOutlet private var yeastLabel: UILabel!
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var stackView: UIStackView!
    
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
        
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -20).isActive = true
        
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
        foodPairingsLabel.text = presenter.foodPairings
        maltLabel.text = presenter.maltIngredients
        hopsLabel.text = presenter.hopsIngredients
        yeastLabel.text = presenter.yeastIngredients
    }
    
    @objc func toggleFav() {
        presenter.isFavourite = !presenter.isFavourite
        button.tintColor = presenter.isFavourite ? .orange : .gray
    }
}
