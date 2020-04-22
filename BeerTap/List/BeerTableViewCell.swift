//
//  BeerTableViewCell.swift
//  BeerTap
//
//  Created by Alina Ene on 22/04/2020.
//  Copyright © 2020 Alina Ene. All rights reserved.
//

import UIKit
import AlamofireImage

class BeerTableViewCell: UITableViewCell {
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var iconImageView: UIImageView!
    @IBOutlet private var abvLabel: UILabel!
    @IBOutlet private var favouriteButton: UIButton!
    
    var beerPresenter: BeerPresenter? {
        didSet {
            if let presenter = beerPresenter {
                titleLabel.text = presenter.title
                abvLabel.text = presenter.abv
                if let url = presenter.imageUrl {
                    iconImageView.af.setImage(withURL: url)
                }
                let image = UIImage(named: "star")?.withRenderingMode(.alwaysTemplate)
                favouriteButton.setImage(image, for: .normal)
                favouriteButton.tintColor = presenter.isFavourite ? .yellow : .gray
                favouriteButton.addTarget(self, action: #selector(toggleFav), for: .touchUpInside)
            }
        }
    }
    
    @objc func toggleFav() {
        if let presenter = beerPresenter {
            presenter.isFavourite = !presenter.isFavourite
            favouriteButton.tintColor = presenter.isFavourite ? .yellow : .gray
        }
        
    }
}
