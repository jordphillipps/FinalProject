//
//  ItemTableViewCell.swift
//  FinalProjectApp
//
//  Created by Jordan Phillipps on 10/04/2016.
//  Copyright © 2016 JordanPhillipps. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet var itemLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
