//
//  FriendsTableViewController.swift
//  Mood Tracker Mobile 1 Challenge
//
//  Created by Matthew Harrilal on 9/26/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit

class FriendsTableViewController: UITableViewController {
    // Instantiate our User model class
    var user = [User]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func unwindToDisplayMood(_ segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func unwindToFriendsTableViewController(_ segue: UIStoryboardSegue) {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("The amount of users is correctly being returned on the cells")
        return user.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let row = indexPath.row
        
        let note = user[row]
        
        cell.detailTextLabel?.text = note.mood
        
        return cell
        
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "displayMood" {
//                print("User has tapped on an exisiting mood")
//                let indexPath = tableView.indexPathForSelectedRow!
//                
//                var mood = user[indexPath.row]
//                
//                    let displayMoodViewController = segue.destination as! DisplayMood
//                displayMoodViewController.mood = mood                
                
            }
            else if identifier == "addNote" {
                print("The user has tapped on the add note button")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }
}
