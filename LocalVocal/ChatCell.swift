//
//  ChatCell.swift
//  LocalVocal
//
//  Created by Chris Slowik on 4/18/16.
//  Copyright © 2016 Chris Slowik. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {

    //MARK:- Properties
    let messageLabel: UILabel = UILabel()
    private let bubbleImageView = UIImageView()

    //MARK:- Lifecycle
    // initialization
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        bubbleImageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(bubbleImageView)
        bubbleImageView.addSubview(messageLabel)
        
        
    }
}
