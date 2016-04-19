//
//  ChatCell.swift
//  LocalVocal
//
//  Created by Chris Slowik on 4/18/16.
//  Copyright © 2016 Chris Slowik. All rights reserved.
//

import UIKit
import SnapKit

class ChatCell: UITableViewCell {

    //MARK:- Properties
    let messageLabel: UILabel = UILabel()
    private let bubbleImageView = UIImageView()
    
    let incomingColor = UIColor(red:0.849,  green:0.849,  blue:0.849, alpha:1)
    let outgoingColor = UIColor(red:0.22,  green:0.67,  blue:0.74, alpha:1)

    //MARK:- Lifecycle
    // initialization
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(bubbleImageView)
        bubbleImageView.addSubview(messageLabel)
        
        // center message in bubble
        messageLabel.snp_makeConstraints { (make) in
            make.center.equalTo(bubbleImageView.center)
        }
        
        // resize bubble to messageLabel, plus a lil extra width
        // and position within content view
        bubbleImageView.snp_makeConstraints { (make) in
            make.height.equalTo(messageLabel).offset(24)
            make.width.equalTo(messageLabel).offset(40)
            make.top.equalTo(contentView)
            make.trailing.equalTo(contentView).offset(-10)
            make.leading.equalTo(contentView.snp_centerX).offset(-60)
        }
        
        // messageLabel config
        messageLabel.textAlignment = .Left
        messageLabel.numberOfLines = 0
        messageLabel.textColor = UIColor.whiteColor()
        
        let image = UIImage(named: "bubbleImage")?.imageWithRenderingMode(.AlwaysTemplate)
        bubbleImageView.tintColor = outgoingColor
        bubbleImageView.image = image
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Utility
    func incoming(incoming: Bool) {
        if incoming {
            bubbleImageView.snp_remakeConstraints { (make) in
                make.height.equalTo(messageLabel).offset(24)
                make.width.equalTo(messageLabel).offset(40)
                make.top.equalTo(contentView)
                make.leading.equalTo(contentView).offset(10)
                make.trailing.equalTo(contentView.snp_centerX).offset(60)
            }
            let image = UIImage(named: "incomingBubbleImage")?.imageWithRenderingMode(.AlwaysTemplate)
            bubbleImageView.tintColor = incomingColor
            bubbleImageView.image = image
            messageLabel.textColor = UIColor(red:0.133,  green:0.152,  blue:0.182, alpha:1)
        }
    }
}




