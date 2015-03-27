//
//  RecipeTableCell.swift
//  iGNUtrish
//
//  Created by Jeremy S Granger on 3/25/15.
//  Copyright (c) 2015 Jeremy Granger. All rights reserved.
//

import UIKit

class RecipeTableCell: UITableViewCell {
	
	@IBOutlet weak var recipeThumbnail: UIImageView!
	@IBOutlet weak var recipeName: UILabel!
	@IBOutlet weak var calories: UILabel!
	

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
