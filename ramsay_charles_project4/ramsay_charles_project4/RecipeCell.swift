//
//  RecipeCell.swift
//  ramsay_charles_project4
//
//  Created by Charles Ramsay on 12/16/19.
//  Copyright © 2019 Charles Ramsay. All rights reserved.
//

import Foundation
import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var myDescription: UILabel!
    @IBOutlet weak var myIngredients: UILabel!
    @IBOutlet weak var mySteps: UILabel!
    @IBOutlet weak var myNotes: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
