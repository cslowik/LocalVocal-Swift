//
//  ChatBubbleCell.swift
//  LocalVocal
//
//  Created by Chris Slowik on 4/19/16.
//  Copyright © 2016 Chris Slowik. All rights reserved.
//

import UIKit

class ChatBubbleCell: UITableViewCell {
    //MARK:- Properties
    let incomingColor = UIColor(red:0.849,  green:0.849,  blue:0.849, alpha:1)
    let outgoingColor = UIColor(red:0.088,  green:0.501,  blue:0.979, alpha:1)
    
    @IBOutlet weak var bubbleImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    //MARK:- Lifecycle
    // initialization
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // messageLabel config
        messageLabel.textAlignment = .Left
        messageLabel.numberOfLines = 0
        messageLabel.textColor = UIColor.whiteColor()
        
        let image = UIImage(named: "bubbleImage")?.imageWithRenderingMode(.AlwaysTemplate)
        bubbleImage.tintColor = outgoingColor
        bubbleImage.image = image
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:- Utility
    func incoming(incoming: Bool) {
        if incoming {
            let image = UIImage(named: "incomingBubbleImage")?.imageWithRenderingMode(.AlwaysTemplate)
            bubbleImage.tintColor = incomingColor
            bubbleImage.image = image
            messageLabel.textColor = UIColor(red:0.133,  green:0.152,  blue:0.182, alpha:1)
        }
    }

}
