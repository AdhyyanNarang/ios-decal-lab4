//
//  CategoryTableViewCell.swift
//  PokedexLab
//
//  Created by Adhyyan Narang on 3/14/17.
//  Copyright © 2017 iOS Decal. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokeImage: UIImageView!
    @IBOutlet weak var statsLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
}
