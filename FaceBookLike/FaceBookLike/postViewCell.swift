//
//  postViewCell.swift
//  FaceBookLike
//
//  Created by Leo on 6/4/16.
//  Copyright © 2016 Leo. All rights reserved.
//

import UIKit

class postViewCell: UITableViewCell {

    
    @IBOutlet weak var selfieImageView: UIImageView!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
