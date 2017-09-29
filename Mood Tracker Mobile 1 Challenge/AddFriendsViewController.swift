//
//  AddFriendsViewController.swift
//  Mood Tracker Mobile 1 Challenge
//
//  Created by Matthew Harrilal on 9/28/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit

class AddFriendsViewController: UIViewController {
    @IBOutlet weak var friendsTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let friendsTableViewController = segue.destination as! FriendsTableViewController
        if let identifier = segue.identifier {
            if identifier == "toFriends" {
                let mood = User()
                mood.name = friendsTextField.text ?? "Sorry no name"
                friendsTableViewController.user.append(mood)
                friendsTableViewController.tableView.reloadData()
            }
        }
    }
}
