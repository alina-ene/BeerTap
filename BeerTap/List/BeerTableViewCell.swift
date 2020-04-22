//
//  BeerTableViewCell.swift
//  BeerTap
//
//  Created by Alina Ene on 22/04/2020.
//  Copyright © 2020 Alina Ene. All rights reserved.
//

import UIKit

class BeerTableViewCell: UITableViewCell {
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var iconImageView: UIImageView!
    @IBOutlet private var abvLabel: UILabel!
    @IBOutlet private var favouriteButton: UIButton!
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var abv: String? {
        didSet {
            abvLabel.text = abv
        }
    }
    
    var iconString: String? {
        didSet {
            
        }
    }
    
    var isFavourite: Bool? {
        didSet {
            
        }
    }
}
