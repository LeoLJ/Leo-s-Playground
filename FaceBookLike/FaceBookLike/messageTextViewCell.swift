//
//  messageTextViewCell.swift
//  FaceBookLike
//
//  Created by Leo on 6/6/16.
//  Copyright © 2016 Leo. All rights reserved.
//

import UIKit

protocol messageCellDelegate: class{
    func sendMessage(message: String?)
}

class messageTextViewCell: UITableViewCell {
    weak var delegate: messageCellDelegate?
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var selfView: UIImageView!
    
    @IBOutlet weak var selfTextField: UITextField!
    
    @IBAction func sendText(sender: AnyObject) {
            delegate?.sendMessage(selfTextField.text)
            selfTextField.text = nil
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
