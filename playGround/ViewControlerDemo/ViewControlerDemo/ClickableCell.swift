//
//  ClickableCell.swift
//  ViewControlerDemo
//
//  Created by Leo on 6/3/16.
//  Copyright © 2016 Leo. All rights reserved.
//

import UIKit

protocol ClickableCellDelegate: class{
    func sayBye()
}

class ClickableCell: UITableViewCell {
    
   weak var delegate: ClickableCellDelegate?

    @IBAction func sayBye(sender: AnyObject) {
        
        delegate?.sayBye()
    }
    
    @IBAction func sayHi(sender: AnyObject) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
