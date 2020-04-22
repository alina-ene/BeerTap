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
    //food pairings
    //ingredients: malt, hops, yeast
    //is favourited
    //brewer's tips
    //tag line
    //contributor
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = presenter.title
        abvLabel.text = presenter.abv
        if let url = presenter.imageUrl {
            iconImageView.af.setImage(withURL: url)
        }
        descriptionLabel.text = presenter.description
    }
}
