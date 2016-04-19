//
//  ChatViewController.swift
//  LocalVocal
//
//  Created by Chris Slowik on 4/15/16.
//  Copyright © 2016 Chris Slowik. All rights reserved.
//

import UIKit
import SnapKit

class ChatViewController: UIViewController {
    //MARK:- Properties
    private var messages = [Message]()
    private let cellIdentifier = "chatCell"
    // Views
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        // SnapKit, yay!
        tableView.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        // set up bogus data
        var localIncoming = true
        for i in 0...10 {
            let m = Message()
            m.text = "this is a really long message. at some point it will be too long." + String(i)
            m.incoming = localIncoming
            localIncoming = !localIncoming
            messages.append(m)
        }
        
        // register class for tableview
        tableView.registerClass(ChatCell.self, forCellReuseIdentifier: "chatCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ChatViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ChatCell
        let message = messages[indexPath.row]
        cell.messageLabel.text = message.text
        cell.incoming(message.incoming)
        return cell
    }
}

extension ChatViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
}

