//
//  ChatViewController.swift
//  LocalVocal
//
//  Created by Chris Slowik on 4/15/16.
//  Copyright © 2016 Chris Slowik. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    //MARK:- Properties
    private var messages = [Message]()
    private let cellIdentifier = "chatCell"
    // Views
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        // set up constraints for tableview
        // create array of constraints and activate them
        let tableViewConstraints: [NSLayoutConstraint] = [
            tableView.topAnchor.constraintEqualToAnchor(view.topAnchor),
            tableView.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor),
            tableView.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor),
            tableView.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor)
        ]
        NSLayoutConstraint.activateConstraints(tableViewConstraints)
        
        // set up bogus data
        for i in 0...10 {
            let m = Message()
            m.text = String(i)
            messages.append(m)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

