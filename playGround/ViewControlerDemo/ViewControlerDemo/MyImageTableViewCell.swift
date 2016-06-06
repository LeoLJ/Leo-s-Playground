//
//  MyImageTableViewCell.swift
//  ViewControlerDemo
//
//  Created by Leo on 6/2/16.
//  Copyright © 2016 Leo. All rights reserved.
//

import UIKit

class MyImageTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var viewInCell: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
